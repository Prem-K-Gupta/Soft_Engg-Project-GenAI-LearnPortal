PGDMP  %                    |            student_learner_portal_database    16.3    16.3 x    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    student_learner_portal_database    DATABASE     �   CREATE DATABASE student_learner_portal_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Australia.1252';
 /   DROP DATABASE student_learner_portal_database;
                postgres    false            �           1247    17511    weekly_content_type    TYPE     �   CREATE TYPE public.weekly_content_type AS ENUM (
    'module_content_type',
    'assignment_content_type',
    'graded_assignment_content_type',
    'programming_content_type',
    'graded_programming_content_type',
    'html_page_content_type'
);
 &   DROP TYPE public.weekly_content_type;
       public          postgres    false            �            1259    17490    assignment_score    TABLE     �   CREATE TABLE public.assignment_score (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    assignment_id integer NOT NULL,
    score integer NOT NULL
);
 $   DROP TABLE public.assignment_score;
       public         heap    postgres    false            �            1259    16400    course    TABLE     r   CREATE TABLE public.course (
    course_id smallint NOT NULL,
    course_title character varying(100) NOT NULL
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    16399    course_course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_course_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.course_course_id_seq;
       public          postgres    false    216            �           0    0    course_course_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;
          public          postgres    false    215            �            1259    17463    course_page_content    TABLE     d   CREATE TABLE public.course_page_content (
    content_id integer NOT NULL,
    html_content text
);
 '   DROP TABLE public.course_page_content;
       public         heap    postgres    false            �            1259    16533    graded_assignment_content    TABLE     �   CREATE TABLE public.graded_assignment_content (
    content_id integer NOT NULL,
    deadline timestamp with time zone NOT NULL
);
 -   DROP TABLE public.graded_assignment_content;
       public         heap    postgres    false            �            1259    16576 %   graded_programming_assignment_content    TABLE     �   CREATE TABLE public.graded_programming_assignment_content (
    content_id integer NOT NULL,
    deadline timestamp with time zone NOT NULL,
    problem_statement text NOT NULL
);
 9   DROP TABLE public.graded_programming_assignment_content;
       public         heap    postgres    false            �            1259    16618 
   mcq_option    TABLE     �   CREATE TABLE public.mcq_option (
    option_id integer NOT NULL,
    question_id integer NOT NULL,
    option_text character varying(500) NOT NULL,
    is_correct boolean DEFAULT false NOT NULL
);
    DROP TABLE public.mcq_option;
       public         heap    postgres    false            �            1259    16616    mcq_option_option_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mcq_option_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.mcq_option_option_id_seq;
       public          postgres    false    230            �           0    0    mcq_option_option_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.mcq_option_option_id_seq OWNED BY public.mcq_option.option_id;
          public          postgres    false    229            �            1259    16592    mcq_question    TABLE       CREATE TABLE public.mcq_question (
    question_id integer NOT NULL,
    assignment_id smallint NOT NULL,
    question_text character varying(5000) NOT NULL,
    question_score smallint NOT NULL,
    CONSTRAINT mcq_question_question_score_check CHECK ((question_score >= 0))
);
     DROP TABLE public.mcq_question;
       public         heap    postgres    false            �            1259    16590    mcq_question_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mcq_question_question_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mcq_question_question_id_seq;
       public          postgres    false    228            �           0    0    mcq_question_question_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mcq_question_question_id_seq OWNED BY public.mcq_question.question_id;
          public          postgres    false    227            �            1259    16547    programming_assignment_content    TABLE     }   CREATE TABLE public.programming_assignment_content (
    content_id integer NOT NULL,
    problem_statement text NOT NULL
);
 2   DROP TABLE public.programming_assignment_content;
       public         heap    postgres    false            �            1259    16663    programming_test_case    TABLE     $  CREATE TABLE public.programming_test_case (
    test_case_id integer NOT NULL,
    assignment_id smallint NOT NULL,
    input_text text NOT NULL,
    expected_output text NOT NULL,
    memory_limit_byte integer,
    time_limit_second integer,
    is_private boolean DEFAULT false NOT NULL
);
 )   DROP TABLE public.programming_test_case;
       public         heap    postgres    false            �            1259    16662 &   programming_test_case_test_case_id_seq    SEQUENCE     �   CREATE SEQUENCE public.programming_test_case_test_case_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.programming_test_case_test_case_id_seq;
       public          postgres    false    236            �           0    0 &   programming_test_case_test_case_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.programming_test_case_test_case_id_seq OWNED BY public.programming_test_case.test_case_id;
          public          postgres    false    235            �            1259    16634    saved_mcq_question    TABLE     �   CREATE TABLE public.saved_mcq_question (
    question_id integer NOT NULL,
    question_text character varying(5000) NOT NULL,
    week_id smallint NOT NULL,
    student_id integer NOT NULL
);
 &   DROP TABLE public.saved_mcq_question;
       public         heap    postgres    false            �            1259    16633 !   saved_mcq_content_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.saved_mcq_content_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.saved_mcq_content_question_id_seq;
       public          postgres    false    232            �           0    0 !   saved_mcq_content_question_id_seq    SEQUENCE OWNED BY     h   ALTER SEQUENCE public.saved_mcq_content_question_id_seq OWNED BY public.saved_mcq_question.question_id;
          public          postgres    false    231            �            1259    16648    saved_mcq_option    TABLE     �   CREATE TABLE public.saved_mcq_option (
    option_id integer NOT NULL,
    question_id integer NOT NULL,
    option_text character varying(500) NOT NULL,
    is_correct boolean DEFAULT false NOT NULL
);
 $   DROP TABLE public.saved_mcq_option;
       public         heap    postgres    false            �            1259    16647    saved_mcq_option_option_id_seq    SEQUENCE     �   CREATE SEQUENCE public.saved_mcq_option_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.saved_mcq_option_option_id_seq;
       public          postgres    false    234            �           0    0    saved_mcq_option_option_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.saved_mcq_option_option_id_seq OWNED BY public.saved_mcq_option.option_id;
          public          postgres    false    233            �            1259    16507    student    TABLE     s   CREATE TABLE public.student (
    student_id smallint NOT NULL,
    student_name character varying(50) NOT NULL
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    16691 $   student_graded_mcq_assignment_result    TABLE     �   CREATE TABLE public.student_graded_mcq_assignment_result (
    student_id smallint NOT NULL,
    assignment_id integer NOT NULL,
    question_id integer NOT NULL,
    marked_option_id integer NOT NULL,
    is_correct boolean NOT NULL
);
 8   DROP TABLE public.student_graded_mcq_assignment_result;
       public         heap    postgres    false            �            1259    16506    student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_student_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.student_student_id_seq;
       public          postgres    false    223            �           0    0    student_student_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;
          public          postgres    false    222            �            1259    17447    submitted_assignment    TABLE     �   CREATE TABLE public.submitted_assignment (
    student_id integer NOT NULL,
    assignment_id integer NOT NULL,
    submission_id integer NOT NULL
);
 (   DROP TABLE public.submitted_assignment;
       public         heap    postgres    false            �            1259    17523 &   submitted_assignment_submission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.submitted_assignment_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.submitted_assignment_submission_id_seq;
       public          postgres    false    238            �           0    0 &   submitted_assignment_submission_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.submitted_assignment_submission_id_seq OWNED BY public.submitted_assignment.submission_id;
          public          postgres    false    241            �            1259    16491    video_module    TABLE     �   CREATE TABLE public.video_module (
    content_id integer NOT NULL,
    video_id character varying(50) NOT NULL,
    transcript_uri character varying(500),
    tags_uri character varying(500)
);
     DROP TABLE public.video_module;
       public         heap    postgres    false            �            1259    16456    week    TABLE     �   CREATE TABLE public.week (
    week_id smallint NOT NULL,
    course_id smallint NOT NULL,
    week_name character varying(50) NOT NULL,
    begin_date timestamp with time zone NOT NULL
);
    DROP TABLE public.week;
       public         heap    postgres    false            �            1259    16454    week_week_id_seq    SEQUENCE     �   CREATE SEQUENCE public.week_week_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.week_week_id_seq;
       public          postgres    false    218            �           0    0    week_week_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.week_week_id_seq OWNED BY public.week.week_id;
          public          postgres    false    217            �            1259    16475    weekly_content    TABLE     �   CREATE TABLE public.weekly_content (
    content_id integer NOT NULL,
    week_id smallint NOT NULL,
    title character varying(500) NOT NULL,
    arrangement_order smallint NOT NULL,
    content_type public.weekly_content_type NOT NULL
);
 "   DROP TABLE public.weekly_content;
       public         heap    postgres    false    917            �            1259    16473    weekly_content_content_id_seq    SEQUENCE     �   CREATE SEQUENCE public.weekly_content_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.weekly_content_content_id_seq;
       public          postgres    false    220            �           0    0    weekly_content_content_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.weekly_content_content_id_seq OWNED BY public.weekly_content.content_id;
          public          postgres    false    219            �           2604    16403    course course_id    DEFAULT     t   ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);
 ?   ALTER TABLE public.course ALTER COLUMN course_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16621    mcq_option option_id    DEFAULT     |   ALTER TABLE ONLY public.mcq_option ALTER COLUMN option_id SET DEFAULT nextval('public.mcq_option_option_id_seq'::regclass);
 C   ALTER TABLE public.mcq_option ALTER COLUMN option_id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16607    mcq_question question_id    DEFAULT     �   ALTER TABLE ONLY public.mcq_question ALTER COLUMN question_id SET DEFAULT nextval('public.mcq_question_question_id_seq'::regclass);
 G   ALTER TABLE public.mcq_question ALTER COLUMN question_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16666 "   programming_test_case test_case_id    DEFAULT     �   ALTER TABLE ONLY public.programming_test_case ALTER COLUMN test_case_id SET DEFAULT nextval('public.programming_test_case_test_case_id_seq'::regclass);
 Q   ALTER TABLE public.programming_test_case ALTER COLUMN test_case_id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    16651    saved_mcq_option option_id    DEFAULT     �   ALTER TABLE ONLY public.saved_mcq_option ALTER COLUMN option_id SET DEFAULT nextval('public.saved_mcq_option_option_id_seq'::regclass);
 I   ALTER TABLE public.saved_mcq_option ALTER COLUMN option_id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16637    saved_mcq_question question_id    DEFAULT     �   ALTER TABLE ONLY public.saved_mcq_question ALTER COLUMN question_id SET DEFAULT nextval('public.saved_mcq_content_question_id_seq'::regclass);
 M   ALTER TABLE public.saved_mcq_question ALTER COLUMN question_id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    16510    student student_id    DEFAULT     x   ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);
 A   ALTER TABLE public.student ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    17524 "   submitted_assignment submission_id    DEFAULT     �   ALTER TABLE ONLY public.submitted_assignment ALTER COLUMN submission_id SET DEFAULT nextval('public.submitted_assignment_submission_id_seq'::regclass);
 Q   ALTER TABLE public.submitted_assignment ALTER COLUMN submission_id DROP DEFAULT;
       public          postgres    false    241    238            �           2604    16459    week week_id    DEFAULT     l   ALTER TABLE ONLY public.week ALTER COLUMN week_id SET DEFAULT nextval('public.week_week_id_seq'::regclass);
 ;   ALTER TABLE public.week ALTER COLUMN week_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16478    weekly_content content_id    DEFAULT     �   ALTER TABLE ONLY public.weekly_content ALTER COLUMN content_id SET DEFAULT nextval('public.weekly_content_content_id_seq'::regclass);
 H   ALTER TABLE public.weekly_content ALTER COLUMN content_id DROP DEFAULT;
       public          postgres    false    219    220    220            �          0    17490    assignment_score 
   TABLE DATA           W   COPY public.assignment_score (student_id, course_id, assignment_id, score) FROM stdin;
    public          postgres    false    240   �       v          0    16400    course 
   TABLE DATA           9   COPY public.course (course_id, course_title) FROM stdin;
    public          postgres    false    216   )�       �          0    17463    course_page_content 
   TABLE DATA           G   COPY public.course_page_content (content_id, html_content) FROM stdin;
    public          postgres    false    239   F�       ~          0    16533    graded_assignment_content 
   TABLE DATA           I   COPY public.graded_assignment_content (content_id, deadline) FROM stdin;
    public          postgres    false    224   c�       �          0    16576 %   graded_programming_assignment_content 
   TABLE DATA           h   COPY public.graded_programming_assignment_content (content_id, deadline, problem_statement) FROM stdin;
    public          postgres    false    226   ��       �          0    16618 
   mcq_option 
   TABLE DATA           U   COPY public.mcq_option (option_id, question_id, option_text, is_correct) FROM stdin;
    public          postgres    false    230   ��       �          0    16592    mcq_question 
   TABLE DATA           a   COPY public.mcq_question (question_id, assignment_id, question_text, question_score) FROM stdin;
    public          postgres    false    228   ��                 0    16547    programming_assignment_content 
   TABLE DATA           W   COPY public.programming_assignment_content (content_id, problem_statement) FROM stdin;
    public          postgres    false    225   צ       �          0    16663    programming_test_case 
   TABLE DATA           �   COPY public.programming_test_case (test_case_id, assignment_id, input_text, expected_output, memory_limit_byte, time_limit_second, is_private) FROM stdin;
    public          postgres    false    236   ��       �          0    16648    saved_mcq_option 
   TABLE DATA           [   COPY public.saved_mcq_option (option_id, question_id, option_text, is_correct) FROM stdin;
    public          postgres    false    234   �       �          0    16634    saved_mcq_question 
   TABLE DATA           ]   COPY public.saved_mcq_question (question_id, question_text, week_id, student_id) FROM stdin;
    public          postgres    false    232   .�       }          0    16507    student 
   TABLE DATA           ;   COPY public.student (student_id, student_name) FROM stdin;
    public          postgres    false    223   K�       �          0    16691 $   student_graded_mcq_assignment_result 
   TABLE DATA           �   COPY public.student_graded_mcq_assignment_result (student_id, assignment_id, question_id, marked_option_id, is_correct) FROM stdin;
    public          postgres    false    237   h�       �          0    17447    submitted_assignment 
   TABLE DATA           X   COPY public.submitted_assignment (student_id, assignment_id, submission_id) FROM stdin;
    public          postgres    false    238   ��       {          0    16491    video_module 
   TABLE DATA           V   COPY public.video_module (content_id, video_id, transcript_uri, tags_uri) FROM stdin;
    public          postgres    false    221   ��       x          0    16456    week 
   TABLE DATA           I   COPY public.week (week_id, course_id, week_name, begin_date) FROM stdin;
    public          postgres    false    218   ��       z          0    16475    weekly_content 
   TABLE DATA           e   COPY public.weekly_content (content_id, week_id, title, arrangement_order, content_type) FROM stdin;
    public          postgres    false    220   ܧ       �           0    0    course_course_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.course_course_id_seq', 1, true);
          public          postgres    false    215            �           0    0    mcq_option_option_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mcq_option_option_id_seq', 1, false);
          public          postgres    false    229            �           0    0    mcq_question_question_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mcq_question_question_id_seq', 1, false);
          public          postgres    false    227            �           0    0 &   programming_test_case_test_case_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.programming_test_case_test_case_id_seq', 1, false);
          public          postgres    false    235            �           0    0 !   saved_mcq_content_question_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.saved_mcq_content_question_id_seq', 1, false);
          public          postgres    false    231            �           0    0    saved_mcq_option_option_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.saved_mcq_option_option_id_seq', 1, false);
          public          postgres    false    233            �           0    0    student_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.student_student_id_seq', 1, false);
          public          postgres    false    222            �           0    0 &   submitted_assignment_submission_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.submitted_assignment_submission_id_seq', 1, false);
          public          postgres    false    241            �           0    0    week_week_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.week_week_id_seq', 1, true);
          public          postgres    false    217            �           0    0    weekly_content_content_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.weekly_content_content_id_seq', 1, true);
          public          postgres    false    219            �           2606    17494 &   assignment_score assignment_score_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.assignment_score
    ADD CONSTRAINT assignment_score_pkey PRIMARY KEY (student_id, course_id, assignment_id);
 P   ALTER TABLE ONLY public.assignment_score DROP CONSTRAINT assignment_score_pkey;
       public            postgres    false    240    240    240            �           2606    16407    course course_course_title_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_title_key UNIQUE (course_title);
 H   ALTER TABLE ONLY public.course DROP CONSTRAINT course_course_title_key;
       public            postgres    false    216            �           2606    17469 ,   course_page_content course_page_content_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.course_page_content
    ADD CONSTRAINT course_page_content_pkey PRIMARY KEY (content_id);
 V   ALTER TABLE ONLY public.course_page_content DROP CONSTRAINT course_page_content_pkey;
       public            postgres    false    239            �           2606    16405    course course_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public            postgres    false    216            �           2606    16544 8   graded_assignment_content graded_assignment_content_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.graded_assignment_content
    ADD CONSTRAINT graded_assignment_content_pkey PRIMARY KEY (content_id);
 b   ALTER TABLE ONLY public.graded_assignment_content DROP CONSTRAINT graded_assignment_content_pkey;
       public            postgres    false    224            �           2606    16587 P   graded_programming_assignment_content graded_programming_assignment_content_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.graded_programming_assignment_content
    ADD CONSTRAINT graded_programming_assignment_content_pkey PRIMARY KEY (content_id);
 z   ALTER TABLE ONLY public.graded_programming_assignment_content DROP CONSTRAINT graded_programming_assignment_content_pkey;
       public            postgres    false    226            �           2606    16627    mcq_option mcq_option_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.mcq_option
    ADD CONSTRAINT mcq_option_pkey PRIMARY KEY (option_id);
 D   ALTER TABLE ONLY public.mcq_option DROP CONSTRAINT mcq_option_pkey;
       public            postgres    false    230            �           2606    16609    mcq_question mcq_question_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.mcq_question
    ADD CONSTRAINT mcq_question_pkey PRIMARY KEY (question_id);
 H   ALTER TABLE ONLY public.mcq_question DROP CONSTRAINT mcq_question_pkey;
       public            postgres    false    228            �           2606    16558 B   programming_assignment_content programming_assignment_content_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.programming_assignment_content
    ADD CONSTRAINT programming_assignment_content_pkey PRIMARY KEY (content_id);
 l   ALTER TABLE ONLY public.programming_assignment_content DROP CONSTRAINT programming_assignment_content_pkey;
       public            postgres    false    225            �           2606    16670 0   programming_test_case programming_test_case_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.programming_test_case
    ADD CONSTRAINT programming_test_case_pkey PRIMARY KEY (test_case_id);
 Z   ALTER TABLE ONLY public.programming_test_case DROP CONSTRAINT programming_test_case_pkey;
       public            postgres    false    236            �           2606    16641 )   saved_mcq_question saved_mcq_content_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.saved_mcq_question
    ADD CONSTRAINT saved_mcq_content_pkey PRIMARY KEY (question_id);
 S   ALTER TABLE ONLY public.saved_mcq_question DROP CONSTRAINT saved_mcq_content_pkey;
       public            postgres    false    232            �           2606    16656 &   saved_mcq_option saved_mcq_option_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.saved_mcq_option
    ADD CONSTRAINT saved_mcq_option_pkey PRIMARY KEY (option_id);
 P   ALTER TABLE ONLY public.saved_mcq_option DROP CONSTRAINT saved_mcq_option_pkey;
       public            postgres    false    234            �           2606    16695 N   student_graded_mcq_assignment_result student_graded_mcq_assignment_result_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result
    ADD CONSTRAINT student_graded_mcq_assignment_result_pkey PRIMARY KEY (student_id, assignment_id, question_id);
 x   ALTER TABLE ONLY public.student_graded_mcq_assignment_result DROP CONSTRAINT student_graded_mcq_assignment_result_pkey;
       public            postgres    false    237    237    237            �           2606    16512    student student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    223            �           2606    17529 .   submitted_assignment submitted_assignment_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.submitted_assignment
    ADD CONSTRAINT submitted_assignment_pkey PRIMARY KEY (submission_id);
 X   ALTER TABLE ONLY public.submitted_assignment DROP CONSTRAINT submitted_assignment_pkey;
       public            postgres    false    238            �           2606    17420    video_module video_module_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.video_module
    ADD CONSTRAINT video_module_pkey PRIMARY KEY (content_id);
 H   ALTER TABLE ONLY public.video_module DROP CONSTRAINT video_module_pkey;
       public            postgres    false    221            �           2606    16462    week week_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_pkey PRIMARY KEY (week_id);
 8   ALTER TABLE ONLY public.week DROP CONSTRAINT week_pkey;
       public            postgres    false    218            �           2606    16483 "   weekly_content weekly_content_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.weekly_content
    ADD CONSTRAINT weekly_content_pkey PRIMARY KEY (content_id);
 L   ALTER TABLE ONLY public.weekly_content DROP CONSTRAINT weekly_content_pkey;
       public            postgres    false    220            �           2606    16490 >   weekly_content weekly_content_week_id_arrarrangement_order_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.weekly_content
    ADD CONSTRAINT weekly_content_week_id_arrarrangement_order_key UNIQUE (week_id, arrangement_order);
 h   ALTER TABLE ONLY public.weekly_content DROP CONSTRAINT weekly_content_week_id_arrarrangement_order_key;
       public            postgres    false    220    220            �           2606    17505 4   assignment_score assignment_score_assignment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assignment_score
    ADD CONSTRAINT assignment_score_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.assignment_score DROP CONSTRAINT assignment_score_assignment_id_fkey;
       public          postgres    false    4785    220    240            �           2606    17500 0   assignment_score assignment_score_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assignment_score
    ADD CONSTRAINT assignment_score_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.assignment_score DROP CONSTRAINT assignment_score_course_id_fkey;
       public          postgres    false    216    240    4781            �           2606    17495 1   assignment_score assignment_score_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assignment_score
    ADD CONSTRAINT assignment_score_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.assignment_score DROP CONSTRAINT assignment_score_student_id_fkey;
       public          postgres    false    240    4791    223            �           2606    17470 7   course_page_content course_page_content_content_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_page_content
    ADD CONSTRAINT course_page_content_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.course_page_content DROP CONSTRAINT course_page_content_content_id_fkey;
       public          postgres    false    4785    239    220            �           2606    17431 C   graded_assignment_content graded_assignment_content_content_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.graded_assignment_content
    ADD CONSTRAINT graded_assignment_content_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 m   ALTER TABLE ONLY public.graded_assignment_content DROP CONSTRAINT graded_assignment_content_content_id_fkey;
       public          postgres    false    4785    220    224            �           2606    17436 [   graded_programming_assignment_content graded_programming_assignment_content_content_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.graded_programming_assignment_content
    ADD CONSTRAINT graded_programming_assignment_content_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 �   ALTER TABLE ONLY public.graded_programming_assignment_content DROP CONSTRAINT graded_programming_assignment_content_content_id_fkey;
       public          postgres    false    220    4785    226            �           2606    16628 &   mcq_option mcq_option_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mcq_option
    ADD CONSTRAINT mcq_option_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.mcq_question(question_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.mcq_option DROP CONSTRAINT mcq_option_question_id_fkey;
       public          postgres    false    230    4799    228            �           2606    16602 ,   mcq_question mcq_question_assignment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mcq_question
    ADD CONSTRAINT mcq_question_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.mcq_question DROP CONSTRAINT mcq_question_assignment_id_fkey;
       public          postgres    false    4785    220    228            �           2606    17441 M   programming_assignment_content programming_assignment_content_content_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programming_assignment_content
    ADD CONSTRAINT programming_assignment_content_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 w   ALTER TABLE ONLY public.programming_assignment_content DROP CONSTRAINT programming_assignment_content_content_id_fkey;
       public          postgres    false    4785    220    225            �           2606    16671 >   programming_test_case programming_test_case_assignment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programming_test_case
    ADD CONSTRAINT programming_test_case_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.programming_test_case DROP CONSTRAINT programming_test_case_assignment_id_fkey;
       public          postgres    false    236    220    4785            �           2606    16642 1   saved_mcq_question saved_mcq_content_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.saved_mcq_question
    ADD CONSTRAINT saved_mcq_content_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(week_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.saved_mcq_question DROP CONSTRAINT saved_mcq_content_week_id_fkey;
       public          postgres    false    232    218    4783            �           2606    16657 2   saved_mcq_option saved_mcq_option_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.saved_mcq_option
    ADD CONSTRAINT saved_mcq_option_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.saved_mcq_question(question_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.saved_mcq_option DROP CONSTRAINT saved_mcq_option_question_id_fkey;
       public          postgres    false    234    232    4803            �           2606    17411 5   saved_mcq_question saved_mcq_question_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.saved_mcq_question
    ADD CONSTRAINT saved_mcq_question_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 _   ALTER TABLE ONLY public.saved_mcq_question DROP CONSTRAINT saved_mcq_question_student_id_fkey;
       public          postgres    false    4791    232    223            �           2606    16711 \   student_graded_mcq_assignment_result student_graded_mcq_assignment_result_assignment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result
    ADD CONSTRAINT student_graded_mcq_assignment_result_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.weekly_content(content_id);
 �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result DROP CONSTRAINT student_graded_mcq_assignment_result_assignment_id_fkey;
       public          postgres    false    220    4785    237            �           2606    16701 _   student_graded_mcq_assignment_result student_graded_mcq_assignment_result_marked_option_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result
    ADD CONSTRAINT student_graded_mcq_assignment_result_marked_option_id_fkey FOREIGN KEY (marked_option_id) REFERENCES public.mcq_option(option_id);
 �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result DROP CONSTRAINT student_graded_mcq_assignment_result_marked_option_id_fkey;
       public          postgres    false    230    237    4801            �           2606    16696 Z   student_graded_mcq_assignment_result student_graded_mcq_assignment_result_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result
    ADD CONSTRAINT student_graded_mcq_assignment_result_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.mcq_question(question_id);
 �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result DROP CONSTRAINT student_graded_mcq_assignment_result_question_id_fkey;
       public          postgres    false    4799    237    228            �           2606    16706 Y   student_graded_mcq_assignment_result student_graded_mcq_assignment_result_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result
    ADD CONSTRAINT student_graded_mcq_assignment_result_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);
 �   ALTER TABLE ONLY public.student_graded_mcq_assignment_result DROP CONSTRAINT student_graded_mcq_assignment_result_student_id_fkey;
       public          postgres    false    4791    237    223            �           2606    17457 9   submitted_assignment submission_status_assignment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.submitted_assignment
    ADD CONSTRAINT submission_status_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.submitted_assignment DROP CONSTRAINT submission_status_assignment_id_fkey;
       public          postgres    false    220    4785    238            �           2606    17452 6   submitted_assignment submission_status_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.submitted_assignment
    ADD CONSTRAINT submission_status_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.submitted_assignment DROP CONSTRAINT submission_status_student_id_fkey;
       public          postgres    false    238    4791    223            �           2606    17421 )   video_module video_module_content_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.video_module
    ADD CONSTRAINT video_module_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.weekly_content(content_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public.video_module DROP CONSTRAINT video_module_content_id_fkey;
       public          postgres    false    220    4785    221            �           2606    16463    week week_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.week DROP CONSTRAINT week_course_id_fkey;
       public          postgres    false    216    4781    218            �           2606    16484 *   weekly_content weekly_content_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.weekly_content
    ADD CONSTRAINT weekly_content_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(week_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.weekly_content DROP CONSTRAINT weekly_content_week_id_fkey;
       public          postgres    false    4783    218    220            �      x������ � �      v      x������ � �      �      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      }      x������ � �      �      x������ � �      �      x������ � �      {      x������ � �      x      x������ � �      z      x������ � �     