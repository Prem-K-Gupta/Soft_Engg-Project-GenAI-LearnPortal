export default {
  props: {
    courseId: {
      type: Number,
      default: 1
    },
    weekId: {
      type: Number,
      default: 2
    },
    content: {
      type: Object
    }
  },
  data() {
    return {
      assignmentTitle: '',
      question: "",
      deadline: "2024-08-11",
      answers: [],
      errorMessage: '',
      options: ["Python3"],
      selectedLanguage: '', // Define selectedLanguage in the data object
      code: '', // This will hold the content of the Ace Editor
      hint: '', // This will store the hint from the API
      editorOptions: {
        mode: 'python', // Specify the mode, e.g., 'python'
        theme: 'dreamweaver', // Specify the theme, e.g., 'monokai'
        tabSize: 2, // Customize other options
        fontSize: 14 // Customize font size
      },
      output: '',
      testCases: [],
      privateCasesMarksObtained: 0,
      publicCasesMarksObtained: 0,
      privateCasesTotalMarks: 0,
      publicCasesTotalMarks: 0,
      showPrivateCases: false,
      showPublicCases: false,
    };
  },
  methods: {
    async fetchAssignmentData() {

      try {
        const token = localStorage.getItem('authToken'); // Replace with your actual key for the token
        if (!token) {
          throw new Error('No authentication token found');
        }
        const response = await fetch(`/api/course_assignment/1/${this.weekId}/${this.content.id}`, {
          method: 'GET',
          headers: {
            'Authentication-Token': token
          }
        });
        if (!response.ok) {
          throw new Error('Failed to fetch assignment data');
        }
        const data = await response.json();
        console.log(data, 'data')
        this.question = data[this.content.title][0].problem_statement;
      } catch (error) {
        this.errorMessage = error.message;
      }
    },
    async fetchAssignmentTestCases() {

      try {
        const token = localStorage.getItem('authToken'); // Replace with your actual key for the token
        if (!token) {
          throw new Error('No authentication token found');
        }
        const response = await fetch(`/api/programming_assignment_test_cases/${this.content.id}`, {
          method: 'GET',
          headers: {
            'Authentication-Token': token
          }
        });
        if (!response.ok) {
          throw new Error('Failed to fetch assignment test cases');
        }
        const data = await response.json();
        console.log(data, 'data')
        this.testCases = data.Cases.map((testCase) => {
          return {
            ...testCase,
            actualOutput: ""
          }
        })
      } catch (error) {
        this.errorMessage = error.message;
      }
    },
    async fetchHint() {
      try {
        const token = localStorage.getItem('authToken'); // Replace with your actual key for the token
        if (!token) {
          throw new Error('No authentication token found');
        }

        const response = await fetch(`/api/program_hint/${this.assignmentId}`, {
          method: 'GET',
          headers: {
            'Authentication-Token': token // Use the token from localStorage
          }
        });

        if (!response.ok) {
          throw new Error('Failed to fetch hint');
        }

        const data = await response.json();
        this.hint = data.hint;
      } catch (error) {
        this.errorMessage = error.message;
      }
    },
    updateAnswer(answer) {
      const index = this.answers.findIndex(a => a.question_id === answer.question_id);
      if (index !== -1) {
        this.answers[index] = answer;
      } else {
        this.answers.push(answer);
      }
    },
    async submitAssignment() {
      console.log(this.code);
      try {
        const response = await fetch(`/api/course_assignment/${this.courseId}/${this.weekId}/${this.content.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(this.answers)
        });
        if (!response.ok) {
          throw new Error('Failed to submit assignment');
        }
        const result = await response.json();
        alert(result.message);
      } catch (error) {
        this.errorMessage = error.message;
      }
    },
    createDeadLineMidnightIST() {
      if (this.deadline) {
        let dateList = this.deadline.split("-");
        const date = new Date(dateList[0], dateList[1] - 1, dateList[2], 0, 0, 0);
        date.setHours(date.getHours() + 5);
        date.setMinutes(date.getMinutes() + 30);
        return date;
      }
    },
    disableEditor() {
      if (this.selectedLanguage == "Python3") {
        return false
      }
      else {
        return true
      }
    },
    async compileCode() {
      try {
        this.privateCasesMarksObtained = 0
        this.publicCasesMarksObtained = 0
        this.privateCasesTotalMarks = 0
        this.publicCasesTotalMarks = 0
        let i = 0
        for (let testCase of this.testCases) {
          let firstLine = 'x = ' + testCase.input + "\n"
          let lastLine = '\nprint(testFunc(x))'
          const updatedCode = firstLine + this.code + lastLine
          const response = await fetch(`/api/compile`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'Authentication-Token': localStorage.getItem('authToken'), // Replace with your actual authentication token
            },
            body: JSON.stringify({ code: updatedCode })
          });

          if (!response.ok) {
            throw new Error(`Error: ${response.status}`);
          }

          const data = await response.json();
          let result = {
            ...testCase,
            actualOutput: (data.output ?? data.error)?.trim()
          }

          this.testCases.splice(i, 1, result)

          if (result.is_private) {
            this.privateCasesTotalMarks += 1
            if (result.expected_output == result.actualOutput) {
              this.privateCasesMarksObtained += 1
            }
          } else if (!result.is_private) {
            this.publicCasesTotalMarks += 1
            if (result.expected_output == result.actualOutput) {
              this.publicCasesMarksObtained += 1
            }
          }

          i++
        }

      } catch (error) {
        this.errorMessage = error.message || 'Failed to generate summary.';
      }
    },
    displayPublicCasesResult() {
      this.showPublicCases = false
      this.showPublicCases = true
    },
    displayPrivateCasesResult() {
      this.showPrivateCases = false
      this.showPrivateCases = true
    },
    createAceEditor() {
      const editor = ace.edit("editor");
      editor.setTheme(`ace/theme/${this.editorOptions.theme}`);
      editor.session.setMode(`ace/mode/${this.editorOptions.mode}`);

      ace.require("ace/ext/language_tools")
      editor.setOptions({
        fontSize: this.editorOptions.fontSize,
        tabSize: this.editorOptions.tabSize,
        enableBasicAutocompletion: true,
        enableLiveAutocompletion: true,
        enableSnippets: true
      });
      // Bind Ace Editor content to `this.code`
      editor.getSession().on('change', () => {
        this.code = editor.getValue();
      });
    },
  },
  mounted() {
    // Fetch assignment data and hint when component is mounted
    this.fetchAssignmentData();
    this.fetchAssignmentTestCases();
    // this.fetchHint();

    // Initialize Ace Editor when component is mounted
    this.$nextTick(() => {
      this.createAceEditor();
    });
  },
  template: `
    <div class="graded-assignment" style="width: 80%; margin-left: 10px;">
      <div style="background-color: maroon; color: white;">
        <div style="margin-left: 20px; margin-top: 10px;" v-if="createDeadLineMidnightIST() < new Date()">The due date for submitting this assignment has passed.</div>
        <div style="margin-left: 20px; margin-bottom: 20px;" v-if="deadline">Due date: {{ deadline.toLocaleString() }}</div>
        <div style="margin-left: 20px; margin-bottom: 20px;" v-if="showPrivateCases">Private Test Cases Passed: {{ privateCasesMarksObtained }} / {{ privateCasesTotalMarks }}</div>
      </div>
      <div style="margin-left: 20px;">{{ question }}</div>
      <div style="color: red; margin-left: 20px;">This assignment has public test cases. Please click on "Test Run" button to see the status of public test cases. Assignment will be evaluated only after submitting using "Submit" button below. If you only test run the program, your assignment will not be graded and you will not see your score after the deadline.</div>
      <div style="margin-left: 20px;">
        Choose Language:
        <select v-model="selectedLanguage" id="language" style="margin-left: 20px;" class="mb-3">
          <option v-for="option in options" :key="option" :value="option">
            {{ option }}
          </option>
        </select>
      </div>
      
      <div v-if="errorMessage" class="alert alert-danger">{{ errorMessage }}</div>

      <!-- Ace Editor HTML -->
      <div id="editor" :disable="disableEditor()" style="height: 300px; width: 100%; margin: 20px;">{{code}}</div>

      <div>
    <button @click="() => {compileCode(); displayPublicCasesResult();}" class="btn btn-xs btn-primary mt-3">Test Code</button>
    <span v-if="showPublicCases"> Public Test Cases Passed: {{ publicCasesMarksObtained }} / {{ publicCasesTotalMarks }} </span>
    </div>

    <div v-for="(testCase, index) in testCases" :key="index" class="test-case-row">
      <div class="test-case-column">
        <strong>Input:</strong>
        <pre>{{ testCase.input }}</pre>
      </div>
      <div class="test-case-column">
        <strong>Expected Output:</strong>
        <pre>{{ testCase.expected_output }}</pre>
      </div>
      <div class="test-case-column">
        <strong>Actual Output:</strong>
        <pre>{{ testCase.actualOutput }}</pre>
      </div>
    </div>

      <!-- Display Hint -->
      <div v-if="hint" style="margin-left: 20px; margin-top: 20px; font-style: italic; color: darkgreen;">
        Hint: {{ hint }}
      </div>

      <!-- Submit button -->
      <div>
        <button @click="() => {submitAssignment(); displayPrivateCasesResult();}" class="btn btn-primary mt-3">Submit Assignment</button>
      </div>
    </div>
  `
};
