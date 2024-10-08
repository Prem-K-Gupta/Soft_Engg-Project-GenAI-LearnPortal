export default {
    props: {
        courseTitle: {
            type: String,
            default: ''  // Default is empty if no course title is provided
        },
        userEmail: {
            type: String,
            default: ''  // Default is empty if no user email is provided
        }
    },
    computed: {
        showCourseTitle() {
            return this.courseTitle !== '';  // Show course title if provided
        },
        showUserEmail() {
            return this.userEmail !== '';  // Show user email if provided
        }
    },
    template: `
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <div class="container-fluid">
            <router-link to="/home" class="link-primary">
                <img src="https://upload.wikimedia.org/wikipedia/en/6/69/IIT_Madras_Logo.svg" alt="IIT Madras" height="40">
                IIT Madras
            </router-link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item" v-if="showCourseTitle">
                        <a class="nav-link active" aria-current="page" href="#">{{ courseTitle }}</a>  <!-- Dynamic course title -->
                    </li>
                </ul>
                <div class="d-flex" style="margin-right:20px;">
                    <span v-if="showUserEmail">{{ userEmail }}</span>  <!-- Dynamic user email -->
                </div>
                <div class="d-flex">
                    <button v-if="showUserEmail" @click="logout" class="btn btn-danger me-2">Log Out</button>
                </div>
            </div>
        </div>
    </nav>
    `,
    methods: {
        async logout() {
            const response = await fetch("/log_out", {
                method: "POST",
                headers: {
                    'Authentication-Token': localStorage.getItem('authToken'),
                },
            });

            if (response.ok) {
                localStorage.removeItem('authToken');
                console.log('Logout successful');

                // Redirect to the login page
                this.$router.push('/login');
            } else {
                const responseData = await response.json();
                console.error('Logout failed:', responseData.error_message);
            }
        }
    }
};