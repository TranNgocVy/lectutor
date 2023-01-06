import 'language.dart';

class English extends Language {
  English() {
    name = "EN";
  }
  @override
  get back => "Ok";

  // Login Page
  @override
  get login => "Login";

  @override
  get email => "Email";
  @override
  get password => "Password";
  @override
  get enterYourEmail => "Enter your email...";
  @override
  get enterPassword => "enter your password";
  @override
  get loginFail => "Log in failed! Incorrect email or password";

  @override
  get signUpQuestion => "Not a member yet? ";
  @override
  get signUp => "Sign Up";
  @override
  get signIn => "Sign In";
  @override
  get forgotPassword => "Forgot password ?";
  @override
  get continueWith => "Or continue with?";
  @override
  get invalidEmail => "Invalid Email";
  @override
  get emptyField => "Please fill in all fields";
  @override
  get passwordTooShort => "Password must be at least 6 characters";
  @override
  get forgotPasswordFail => "Reset password failed";
  @override
  get forgotPasswordSuccess => "Reset password success, please check your email";
  @override
  get titleLogin => "Say hello to your English tutors";
  @override
  get descriptionLogin => "Become fluent faster through one on one video chat lessons tailored to your goals.";

  // Sign Up Page
  // @override
  // get confirmPassword => "Re-enter password";
  // @override
  // get loginQuestion => "Already have a account ?";
  // @override
  // get errEnterAllFields => "Please enter all fields";
  // @override
  // get errPasswordMismatch => "Passwords do not match";
  @override
  get titleSignUp => "Start learning with LetTutor";
  @override
  get descriptionSignup => "Become fluent faster through one on one video chat lessons tailored to your goals.";
  @override
  get hasAccountSignUp => "Already have an account?";
  @override
  get signupSuccess => "You have successfully registered an account. Please check mail to active your account";
  @override
  get signupFail => "You have failed to register for an account. Try again";

  // Reset Password Page
  @override
  get resetPassword => "Reset Password";
  @override
  get descriptionResetPassword => "Please enter your email address to search for your account.";
  @override
  get gobackLogin => "Goback to Login";
  @override
  get confirmREsetPassword => "Send reset link";
  @override
  get notification =>"Notification";
  @override
  get contentNotiResetPassword =>"Check your inbox for a link to reset your password.";
  @override
  get pleaseEnterEmail => "Please enter your registered email";

  //Change password
  @override
  get confirmPassword => "Confirm password";
  @override
  get cotificationPassword => "You have successfully changed password. Please login with new password";
  @override
  get passwordNotMatch => "New password must be the same as the Confirmation password";
  @override
  get passwordLength => "New password must be at least 6 characters";
  @override
  get passwordIncorect => "Incorrect password";

  // Home Page
  @override
  get home => "Home";

  @override
  get totalLessonTime => "Total lesson time is ";
  @override
  get enterRoom => "Enter lesson room";
  @override
  get recommendTutor => "Recommend Tutors";
  @override
  get seeAll => "See all";
  @override
  get wellcome => "Wellcome to LetTutor";
  @override
  get nextLesson => "Upcoming lesson";
  @override
  get bookAlesson => "Book a lesson";
  @override
  get noUpComing => "No upcoming lesson";
  @override
  get totalHours => "Total lesson time is";
  @override
  get hour => "hours";
  @override
  get minutes => "minutes";
  @override
  get startIn => "Start in";
  @override
  get enterroom => "Enter lesson room";
  @override
  get totalLessonTimeIs => "Total lesson time is";

  @override
  get findATutor => "Find a tutor";
  @override
  get enterTutorName => "Enter tutor name";
  @override
  get selectTutorNationality => "Select tutor nationality";
  @override
  get selectAvailableTime => "Select available tutoring time";
  @override
  get selectDate => "Select a day";
  @override
  get selectTime => "Time range";
  @override
  get search => "Search";
  @override
  get resetFilters => "Reset filters";
  @override
  get recommendedTutor => "Recommended Tutors";
  @override
  get book => "Book";
  @override
  get nullString => "null";
  @override
  get noResult => "No suitable tutor";

  // Profile page
  @override
  get account => "Account";
  @override
  get fullName => "Name";
  @override
  get birthday => "Birthday";
  @override
  get phone => "Phone";
  @override
  get country => "Country";
  @override
  get level => "Level";
  @override
  get wantToLearn => "Want to learn";
  @override
  get save => "Save";
  @override
  get errGetNewProfile => "Can't get new profile";
  @override
  get errUploadAvatar => "Upload avatar failed";
  @override
  get successUploadAvatar => "Upload avatar success";
  @override
  get errUpdateProfile => "Update profile failed";
  @override
  get successUpdateProfile => "Update profile success";
  @override
  get errPhoneNumber => "Invalid phone number";
  @override
  get errEnterName => "Please enter your name";
  @override
  get errBirthday => "Birthday is invalid";
  @override
  get emailAddress => "Email address";
  @override
  get learchedule => "Learn schedule";
  @override
  get notificationProfileSuccess =>"Edit profile success";
  @override
  get notificationProfileFail =>"Edit profile fail";
  @override
  get notificationUploadAvatarSuccess=> "Upload avatar successfully";
  @override
  get notificationUploadAvatarFail =>"Upload avatar fail";
  @override
  get emptyStartFile => "Please enter all field has *";
  @override
  get schedulehint => "Note the time of the week you want to study on Lettutor";

  // Course page
  @override
  get course => "Course";
  @override
  get searchCourse => "Search courses...";
  @override
  get lesson => " Lessons";
  @override
  get errNotAnyResult => "Not found any match result...";

  // Course Detail
  @override
  get aboutCourse => "About Course";
  @override
  get overview => "Overview";
  @override
  get why => "Why take this course?";
  @override
  get what => "What will you be able to do?";
  @override
  get topic => "Topic(s)";
  @override
  get tutor => "Tutor";

  // Ebook tab
  @override
  get ebook => "Ebook";
  @override
  get searchEbook => "Search ebook...";

  // Upcoming Page
  @override
  get upcoming => "Upcoming";
  @override
  get cancel => "Cancel";
  @override
  get goToMeeting => "Go to meeting";
  @override
  get dontHaveUpcoming => "You don't have any upcomming...";
  @override
  get removeUpcomingSuccess => "Remove upcoming success";
  @override
  get removeUpcomingFail => "You just can remove upcoming 2 hours before schedule";

  // Tutor search page and Tutor detail page
  @override
  get tutors => "Tutors";
  @override
  get searchTutor => "Search Tutors...";
  @override
  get booking => "Booking";
  @override
  get languages => "Languages";
  @override
  get interests => "Interests";
  @override
  get specialties => "Specialties";
  @override
  get rateAndComment => "Rate and comment";
  @override
  get selectSchedule => "Select available schedule";
  @override
  get selectScheduleDetail => "Select available schedule time";
  @override
  @override
  get bookingSuccess => "Booking success";
  @override
  get favorite =>"Favorite";
  @override
  get report =>"Report";
  @override
  get review =>"Reiew";
  @override
  get link =>"Link";
  @override
  get suggestedCourses =>"Suggested courses";
  @override
  get teacherExperience =>"Teaching experience";
  @override
  get booked =>"Booked";
  @override
  get reserved =>"Reserved";

  // Setting page
  @override
  get setting => "Setting";
  @override
  get changePassword => "Change password";
  @override
  get sessionHistory => "Session history";
  @override
  get advancedSetting => "Advanced setting";
  @override
  get ourWebsite => "Our website";
  @override
  get logout => "Logout";

  // Change password page
  @override
  get newPassword => "New password";
  @override
  get confirmNewPassword => "Enter new password again";
  @override
  get passwordAtLeast => "Password must be at least 6 characters";
  @override
  get changePasswordSuccess => "Change password success";

  // Session history page
  @override
  get giveFeedback => "Give feedback";
  @override
  get watchRecord => "Watch record";
  @override
  get mark => "Mark: ";
  @override
  get tutorNotMark => "Tutor hasn't mark yet";
  @override
  get emptySession => "You don't have any session history";

  // Feedback page
  @override
  get feedback => "Feedback";
  @override
  get hintFeedback => "Enter your feedback here...";
  @override
  get errEnterFeedback => "Please enter your feedback";
  @override
  get errFeedbackLength => "Feedback must be at least 3 words";
  @override
  get successFeedback => "Feedback success";


  // Schedule
  @override
  get schedule => "Schedule";
  @override
  get desciptionSchedule => "Here is a list of the sessions you have booked.\nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours";
  @override
  get requestForLesson => "Request for lesson";
  @override
  get LessonTime => "Lesson Time: ";
  @override
  get session => "Session ";
  @override
  get requestForLessonHint => "Currently there are no requests for this class. Please write down any requests for the teacher.";
  //History
  @override
  get history => "History";
  @override
  get descriptionHistory => "The following is a list of lessons you have attended.\nYou can review the details of the lessons you have attended";
  @override
  get timeAgo => "ago";
  @override
  get addRating => "add a Review";
  @override
  get Rating => "Rating";
  @override
  get noRequestForLesson => "No request for lesson";
  @override
  get tutorHaveNotReviewed => "Tutor haven't reviewed yet";
  @override
  get edit => "Edit";

  //Course
  @override
  get discoverCourse => "Discover Courses";
  @override
  get descriptionDiscoverCourse => "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.";
  @override
  get selectLevel => "Select level";
  @override
  get selectcCategory => "Select category";
  @override
  get sortByLevel => "Sort by level";
  @override
  get asc => "level decreasing";
  @override
  get desc => "level ascending";
  //Course detail
  @override
  get discover => "Discover";
  @override
  get whyTakeThisCourse => "Why take this course";
  @override
  get whatWillYouBeAbleToDo => "What will you be able to do";
  @override
  get experienceLevel => "Experience Level";
  @override
  get courseLength => "Course Length";
  @override
  get listTopic => "List Topics";
  @override
  get SuggestedTutor => "Suggested Tutors";
  @override
  get moreInfo => "More info";

  //Menu
  @override
  get buyLessonMenu => "buy Lesson";
  @override
  get changePasswordMenu => "Change password";
  @override
  get tutorMenu => "Tutor";
  @override
  get scheduleMenu => "Schedule";
  @override
  get historyMenu => "History";
  @override
  get courseMenu => "Course";
  @override
  get mycourseMenu => "My Course";
  @override
  get becomTutorMenu => "Become a tutor";
  @override
  get logoutMenu => "Logout";

  @override
  get bookingDetail => "Booking detail";
  @override
  get bookingTime => "Booking time";
  @override
  get balance => "Balance";
  @override
  get balanceLeft => "";
  @override
  get price => "Price";
  @override
  get note => "Note";
  @override
  get bookingFail => "Booking fail. Try again";


  @override
  get helpReport => "Help us understand what's happening";
  @override
  get firsrReason => "This tutor is annoying me";
  @override
  get secondReason => "This profile is pretending be someone or is fake";
  @override
  get thirdReason => "Inappropriate profile photo";
  @override
  get reasonHint => "Please let us know details about your problem";
  @override
  get success => "successfully";
  @override
  get fail => "failed";
  @override
  get submit => "Submit";

  @override
  get otherReview => "Others review";

}
