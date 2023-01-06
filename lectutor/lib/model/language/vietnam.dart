import 'language.dart';

class VietNamese extends Language {
  VietNamese() {
    name = "VI";
  }
  @override
  get back => "Trở lại";
  // Login Page
  @override
  get login => "Đăng nhập";
  @override
  get email => "Email";
  @override
  get password => "Mật khẩu";
  @override
  get enterYourEmail => "Nhập email của bạn...";
  @override
  get enterPassword => "Nập mật khẩu của bạn...";
  @override
  get loginFail => "Đăng nhập không thành công! Hãy kiểm tra lại email/mật khẩu";
  @override
  get signUpQuestion => "Chưa có tài khoản? ";
  @override
  get signUp => "Đăng ký";
  @override
  get signIn => "Đăng nhập";
  @override
  get forgotPassword => "Quên mật khẩu ?";
  @override
  get continueWith => "Hoặc đăng nhập với?";
  @override
  get invalidEmail => "Email không hợp lệ.";
  @override
  get emptyField => "Vui lòng điền đầy đủ thông tin.";
  @override
  get passwordTooShort => "Mật khẩu ít nhất 6 ký tự.";
  @override
  get forgotPasswordFail => "Reset mật khẩu không thành công.";
  @override
  get forgotPasswordSuccess => "Reset mật khẩu thành công, vui lòng kiểm tra email.";
  @override
  get titleLogin => "Đăng nhập";
  @override
  get descriptionLogin => "Phát triển kỹ năng tiếng Anh nhanh nhất bằng cách học 1 kèm 1 trực tuyến theo mục tiêu và lộ trình dành cho riêng bạn.";
  @override
  get pleaseEnterEmail => "Hãy nhập eamil mà bạn đã dùng để đăng ký";
  // Sign Up Page
  @override
  // get confirmPassword => "Xác nhận mật khẩu";
  // @override
  // get loginQuestion => "Đã có tài khoản? ";
  // @override
  // get errEnterAllFields => "Vui lòng nhập đầy đủ thông tin";
  // @override
  // get errPasswordMismatch => "Mật khẩu không khớp";
  @override
  get titleSignUp => "Đăng ký";
  @override
  get descriptionSignup => "Phát triển kỹ năng tiếng Anh nhanh nhất bằng cách học 1 kèm 1 trực tuyến theo mục tiêu và lộ trình dành cho riêng bạn.";
  @override
  get hasAccountSignUp => "Đã có tài khoản?";
  @override
  get signupSuccess => "Bạn đã đăng ký tài khoản thành công. Vui lòng kiểm tra email để kích hoạt tài khoản";
  @override
  get signupFail => "Bạn đăng ký không thành công. Hãy thử lại.";

  // Reset Password Page
  @override
  get resetPassword => "Đặt lại mật khẩu";
  @override
  get gobackLogin => "Quay lại đăng nhập";
  @override
  get descriptionResetPassword => "Vui lòng nhập email để tìm kiếm tài khoản của bạn.";
  @override
  get confirmREsetPassword => "Xác nhận";
  @override
  get notification =>"Thông báo";
  @override
  get contentNotiResetPassword =>"Kiểm tra hộp thư đến trong email để đặt lại mật khẩu của bạn.";

  //Change password
  @override
  get confirmPassword => "Xác nhận mật khẩu";
  @override
  get cotificationPassword => "Bạn đã thay đổi mật khẩu thành công. Hãy đăng nhập lại với mật khẩu mới";
  @override
  get passwordNotMatch => "Mhật khẩu xác nhận không khớp với mật khẩu mới";
  @override
  get passwordLength => "Mật khẩu phải chứa ít nhất 6 kí tự";
  @override
  get passwordIncorect => "Mật khẩu không dúng";

  // Home Page
  @override
  get home => "Trang chủ";
  @override
  get totalLessonTime => "Tổng thời gian học là ";
  @override
  get enterRoom => "Vào phòng học";
  @override
  get recommendTutor => "Gợi ý gia sư";
  @override
  get seeAll => "Xem tất cả";
  @override
  get wellcome => "Chào mừng đến với LetTutor";
  @override
  get nextLesson => "Buổi học tiếp theo";
  @override
  get bookAlesson => "Đặt lịch học";
  @override
  get noUpComing => "Không có buổi học.";
  @override
  get totalHours => "Tổng số giờ bạn đã học là ";
  @override
  get startIn => "Bắt đầu trong ";
  @override
  get enterroom => "Vào phòng học";
  @override
  get totalLessonTimeIs => "Tổng giờ học là";
  @override
  get hour => "giờ";
  @override
  get minutes => "phút";
  @override
  get noResult => "Không có kết quả phù hợp";


  @override
  get findATutor => "Tìm kiếm gia sư";
  @override
  get enterTutorName => "Nhập tên gia sư";
  @override
  get selectTutorNationality => "Chon quốc tịch gia sư";
  @override
  get selectAvailableTime => "Chọn thời gian dạy kèm có lịch trống:";
  @override
  get selectDate => "Chon một ngày";
  @override
  get selectTime => "Giờ bắt đầu và kết thúc";
  @override
  get search => "Tìm kiếm";
  @override
  get resetFilters => "Đặt lại bộ tìm kiếm";
  @override
  get recommendedTutor => "Gia sư được đề xuấ";
  @override
  get book => "Đặt lịch";
  @override
  get nullString => "Chưa có";


  // Profile page
  @override
  get account => "Tài khoản";
  @override
  get fullName => "Họ tên";
  @override
  get birthday => "Ngày sinh";
  @override
  get phone => "Số điện thoại";
  @override
  get country => "Quốc gia";
  @override
  get level => "Trình độ";
  @override
  get wantToLearn => "Muốn học";
  @override
  get save => "Lưu";
  @override
  get errGetNewProfile => "Không thể cập nhật mới hồ sơ.";
  @override
  get errUploadAvatar => "Thay đổi ảnh đại diện không thành công";
  @override
  get successUploadAvatar => "Thay đổi ảnh đại diện thành công";
  @override
  get errUpdateProfile => "Cập nhật hồ sơ không thành công";
  @override
  get successUpdateProfile => "Cập nhật hồ sơ thành công";
  @override
  get errPhoneNumber => "Số điện thoại không hợp lệ";
  @override
  get errEnterName => "Vui lòng nhập họ tên";
  @override
  get errBirthday => "Ngày sinh không hợp lệ";
  @override
  get emailAddress => "Địa chỉ email";
  @override
  get learchedule => "Lịch học";
  @override
  get notificationProfileSuccess =>"Chỉnh sửa tài khoản thành công";
  @override
  get notificationProfileFail =>"Chỉnh sửa tài khoản thất bại";
  @override
  get notificationUploadAvatarSuccess=> "Cập nhật ảnh đại diện thành công";
  @override
  get notificationUploadAvatarFail =>"Cập nhật ảnh đại diện thất bại";
  @override
  get emptyStartFile => "Hãy nhập tất cả các trường có đánh dấu *";
  @override
  get schedulehint => "Ghi chú thời gian trong tuần bạn muốn học trên Lettutor";

  // Course page
  @override
  get course => "Khoá học";
  @override
  get searchCourse => "Tìm kiếm khoá học...";
  @override
  get lesson => " Bài học";
  @override
  get errNotAnyResult => "Không tìm thấy kết quả tương ứng...";

  // Course Detail
  @override
  get aboutCourse => "Thông tin";
  @override
  get overview => "Tổng quan";
  @override
  get why => "Tại sao bạn nên học khóa học này?";
  @override
  get what => "Bạn có thể làm gì?";
  @override
  get topic => "Chủ đề";
  @override
  get tutor => "Gia sư";

  // Ebook tab
  @override
  get ebook => "Giáo trình";
  @override
  get searchEbook => "Tìm kiếm giáo trình...";

  // Upcoming Page
  @override
  get upcoming => "Sắp diễn ra";
  @override
  get cancel => "Huỷ bỏ";
  @override
  get goToMeeting => "Vào phòng học";
  @override
  get dontHaveUpcoming => "Hiện tại bạn không có buổi học nào sắp diễn ra";
  @override
  get removeUpcomingSuccess => "Huỷ buổi học thành công";
  @override
  get removeUpcomingFail => "Bạn chỉ có thể huỷ buổi học trước giờ học 2 tiếng";

  // Tutor search page and Tutor detail page
  @override
  get tutors => "Gia sư";
  @override
  get searchTutor => "Tìm kiếm gia sư...";
  @override
  get booking => "Đặt lịch học";
  @override
  get languages => "Ngôn ngữ";
  @override
  get interests => "Sở thích";
  @override
  get specialties => "Chuyên ngành";
  @override
  get rateAndComment => "Đánh giá và bình luận";
  @override
  get selectSchedule => "Chọn lịch học";
  @override
  get selectScheduleDetail => "Chọn giờ học";
  @override
  get bookingSuccess => "Đặt lịch học thành công";
  @override
  get favorite =>"Yêu thích";
  @override
  get report =>"Báo cáo";
  @override
  get review =>"Xem đánh giá";
  @override
  get link =>"Tìm hiểu";
  @override
  get suggestedCourses =>"Khóa học tham khảo";
  @override
  get teacherExperience =>"Kinh nghiệm giảng dạy";
  @override
  get booked =>"Đã đặt";
  @override
  get reserved =>"Đã được đặt";
  // Setting page
  @override
  get setting => "Cài đặt";
  @override
  get changePassword => "Đổi mật khẩu";
  @override
  get sessionHistory => "Lịch sử";
  @override
  get advancedSetting => "Cài đặt nâng cao";
  @override
  get ourWebsite => "Trang web của chúng tôi";
  @override
  get logout => "Đăng xuất";

  // Change password page
  @override
  get newPassword => "Mật khẩu mới";
  @override
  get confirmNewPassword => "Nhập lại mật khẩu mới";
  @override
  get passwordAtLeast => "Mật khẩu phải có ít nhất 6 ký tự";
  @override
  get changePasswordSuccess => "Đổi mật khẩu thành công";

  // Session history page
  @override
  get giveFeedback => "Đánh giá";
  @override
  get watchRecord => "Xem lại buổi học";
  @override
  get mark => "Điểm số: ";
  @override
  get tutorNotMark => "Gia sư chưa chấm điểm";
  @override
  get emptySession => "Bạn chưa tham gia buổi học nào !";

  // Feedback page
  @override
  get feedback => "Đánh giá";
  @override
  get hintFeedback => "Nhập nội dung đánh giá của bạn...";
  @override
  get errEnterFeedback => "Vui lòng nhập nội dung đánh giá";
  @override
  get errFeedbackLength => "Nội dung đánh giá phải có ít nhất 3 từ";
  @override
  get successFeedback => "Đánh giá thành công";

  // Schedule
  @override
  get schedule => "Lịch đã đặt";
  @override
  get desciptionSchedule => "Đây là danh sách những khung giờ bạn đã đặt.\nBạn có thể theo dõi khi nào buổi học bắt đầu, tham gia buổi học bằng một cú nhấp chuột hoặc có thể hủy buổi học trước 2 tiếng.";
  @override
  get requestForLesson => "Yêu cầu cho buổi học";
  @override
  get LessonTime => "Thời gian bài học: ";
  @override
  get session => "Buổi ";
  @override
  get requestForLessonHint => "Hiện tại không có yêu cầu cho lớp học này. Xin vui lòng viết ra bất kỳ yêu cầu nào cho giáo viên nếu có.";


  //History
  @override
  get history => "Lịch sử";
  @override
  get descriptionHistory => "Đây là danh sách các bài học bạn đã tham gia.\nBạn có thể xem lại thông tin chi tiết về các buổi học đã tham gia đã tham gia";
  @override
  get timeAgo => "trước";
  @override
  get addRating => "Đánh giá";
  @override
  get Rating => "Đánh giá";
  @override
  get noRequestForLesson => "Không có yêu cầu cho buổi học";
  @override
  get tutorHaveNotReviewed => "Gia sư chưa có đánh giá";
  @override
  get edit => "Chỉnh sửa";

  //Course
  @override
  get discoverCourse => "Khóa học";
  @override
  get descriptionDiscoverCourse => "LiveTutor đã xây dựng nên các khóa học của các lĩnh vực trong cuộc sống chất lượng, bài bản và khoa học nhất cho những người đang có nhu cầu trau dồi thêm kiến thức về các lĩnh vực.";
  @override
  get selectLevel => "Chọn cấp độ";
  @override
  get selectcCategory => "Chọn danh mục";
  @override
  get sortByLevel => "Sắp xếp theo độ khó";
  @override
  get asc => "Tăng dần";
  @override
  get desc => "Giảm dần";
  //Course detail
  @override
  get discover => "Khám phá";
  @override
  get whyTakeThisCourse => "Tại sao bạn nên học khóa học này";
  @override
  get whatWillYouBeAbleToDo => "Bạn có thể làm gì";
  @override
  get experienceLevel => "Trình độ yêu cầu";
  @override
  get courseLength => "Thời lượng khóa học";
  @override
  get listTopic => "Danh sách chủ đề";
  @override
  get SuggestedTutor => "Gợi ý gia sư";
  @override
  get moreInfo => "Xem thêm";

  //Menu
  @override
  get buyLessonMenu => "Mua buổi học";
  @override
  get changePasswordMenu => "Thay đổi mật khẩu";
  @override
  get tutorMenu => "Gia sư";
  @override
  get scheduleMenu => "Lịch học";
  @override
  get historyMenu => "Lịch sử";
  @override
  get courseMenu => "Khóa học";
  @override
  get mycourseMenu => "Khóa học của tôi";
  @override
  get becomTutorMenu => "Đăng lý làm gia sư";
  @override
  get logoutMenu => "Đăng xuất";

  @override
  get bookingDetail => "Chi tiết đặt lịch";
  @override
  get bookingTime => "thời gian học";
  @override
  get balance => "Số dư";
  @override
  get balanceLeft => "";
  @override
  get price => "Giá";
  @override
  get note => "Ghi chú";
  @override
  get bookingFail => "Đặt lịch học thất bại. hãy thử lại";


  @override
  get helpReport => "Giúp chúng tôi hiểu chuyện gì đang xảy ra";
  @override
  get firsrReason => "Gia sư này làm phiền tôi";
  @override
  get secondReason => "Hồ sơ này giả mạo";
  @override
  get thirdReason => "Ảnh hồ sơ không phù hợp";
  @override
  get reasonHint => "Vui lòng cho chúng tôi biết chi tiết về vấn đề của bạn";
  @override
  get success => "thành công";
  @override
  get fail => "thất bại";
  @override
  get submit => "Gửi";

  @override
  get otherReview => "Các đánh giá khác";

}
