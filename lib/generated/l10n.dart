// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ĐĂNG NHẬP`
  String get text_welcome_login {
    return Intl.message(
      'ĐĂNG NHẬP',
      name: 'text_welcome_login',
      desc: '',
      args: [],
    );
  }

  /// `Đăng Nhập`
  String get btn_login {
    return Intl.message(
      'Đăng Nhập',
      name: 'btn_login',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm`
  String get btn_search {
    return Intl.message(
      'Tìm kiếm',
      name: 'btn_search',
      desc: '',
      args: [],
    );
  }

  /// `-Select-`
  String get txt_hint_search {
    return Intl.message(
      '-Select-',
      name: 'txt_hint_search',
      desc: '',
      args: [],
    );
  }

  /// `Chưa khai báo`
  String get txt_undefine {
    return Intl.message(
      'Chưa khai báo',
      name: 'txt_undefine',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get txt_save {
    return Intl.message(
      'Lưu',
      name: 'txt_save',
      desc: '',
      args: [],
    );
  }

  /// `Cùng nông dân phát triển bền vững`
  String get txt_logan {
    return Intl.message(
      'Cùng nông dân phát triển bền vững',
      name: 'txt_logan',
      desc: '',
      args: [],
    );
  }

  /// `Trang chu`
  String get home {
    return Intl.message(
      'Trang chu',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get txt_username {
    return Intl.message(
      'Username',
      name: 'txt_username',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get txt_account_phonenumber {
    return Intl.message(
      'Số điện thoại',
      name: 'txt_account_phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get txt_phonenumber {
    return Intl.message(
      'Số điện thoại',
      name: 'txt_phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại...`
  String get txt_input_phonenumber {
    return Intl.message(
      'Vui lòng nhập số điện thoại...',
      name: 'txt_input_phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get txt_password {
    return Intl.message(
      'Mật khẩu',
      name: 'txt_password',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get txt_re_password {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'txt_re_password',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên`
  String get txt_ho_ten {
    return Intl.message(
      'Họ tên',
      name: 'txt_ho_ten',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập họ tên...`
  String get txt_input_ho_ten {
    return Intl.message(
      'Vui lòng nhập họ tên...',
      name: 'txt_input_ho_ten',
      desc: '',
      args: [],
    );
  }

  /// `Chúng tôi đã gửi một mã OTP đến số điện thoại mà bạn đăng ký, vui lòng nhập mã OTP`
  String get txt_sms_otp_desc {
    return Intl.message(
      'Chúng tôi đã gửi một mã OTP đến số điện thoại mà bạn đăng ký, vui lòng nhập mã OTP',
      name: 'txt_sms_otp_desc',
      desc: '',
      args: [],
    );
  }

  /// `Gửi`
  String get btn_submit {
    return Intl.message(
      'Gửi',
      name: 'btn_submit',
      desc: '',
      args: [],
    );
  }

  /// `Ghi nhớ`
  String get switch_remember {
    return Intl.message(
      'Ghi nhớ',
      name: 'switch_remember',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get txt_forget_pass {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'txt_forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get txt_register {
    return Intl.message(
      'Đăng ký',
      name: 'txt_register',
      desc: '',
      args: [],
    );
  }

  /// `Điều kiện lọc`
  String get title_dk_loc {
    return Intl.message(
      'Điều kiện lọc',
      name: 'title_dk_loc',
      desc: '',
      args: [],
    );
  }

  /// `Xem Chi Tiết`
  String get btn_view_detail {
    return Intl.message(
      'Xem Chi Tiết',
      name: 'btn_view_detail',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get btn_save {
    return Intl.message(
      'Lưu',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Đóng`
  String get btn_close {
    return Intl.message(
      'Đóng',
      name: 'btn_close',
      desc: '',
      args: [],
    );
  }

  /// `Hủy Bỏ`
  String get txt_negative_label {
    return Intl.message(
      'Hủy Bỏ',
      name: 'txt_negative_label',
      desc: '',
      args: [],
    );
  }

  /// `Xác Nhận`
  String get txt_positive_label {
    return Intl.message(
      'Xác Nhận',
      name: 'txt_positive_label',
      desc: '',
      args: [],
    );
  }

  /// `Cân`
  String get txt_scale {
    return Intl.message(
      'Cân',
      name: 'txt_scale',
      desc: '',
      args: [],
    );
  }

  /// `Trọng lượng`
  String get txt_weight {
    return Intl.message(
      'Trọng lượng',
      name: 'txt_weight',
      desc: '',
      args: [],
    );
  }

  /// `0 đ`
  String get txt_0d {
    return Intl.message(
      '0 đ',
      name: 'txt_0d',
      desc: '',
      args: [],
    );
  }

  /// `0 kg`
  String get txt_0kg {
    return Intl.message(
      '0 kg',
      name: 'txt_0kg',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã lưu dữ liệu thành công!`
  String get txt_save_success {
    return Intl.message(
      'Bạn đã lưu dữ liệu thành công!',
      name: 'txt_save_success',
      desc: '',
      args: [],
    );
  }

  /// `Về Danh Sách Thu Mua`
  String get txt_return_lst_purchasing {
    return Intl.message(
      'Về Danh Sách Thu Mua',
      name: 'txt_return_lst_purchasing',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp Tục Cân Lúa`
  String get txt_continue_scale {
    return Intl.message(
      'Tiếp Tục Cân Lúa',
      name: 'txt_continue_scale',
      desc: '',
      args: [],
    );
  }

  /// `Cân tiếp`
  String get txt_continue_scale_sort {
    return Intl.message(
      'Cân tiếp',
      name: 'txt_continue_scale_sort',
      desc: '',
      args: [],
    );
  }

  /// `Trọng lượng bao lúa`
  String get txt_weight_bag_rice {
    return Intl.message(
      'Trọng lượng bao lúa',
      name: 'txt_weight_bag_rice',
      desc: '',
      args: [],
    );
  }

  /// `Nhập thủ công`
  String get txt_manual_input {
    return Intl.message(
      'Nhập thủ công',
      name: 'txt_manual_input',
      desc: '',
      args: [],
    );
  }

  /// `Cân Tự Động`
  String get txt_auto_scale {
    return Intl.message(
      'Cân Tự Động',
      name: 'txt_auto_scale',
      desc: '',
      args: [],
    );
  }

  /// `Chọn hình thức cân`
  String get txt_choose_type_scale {
    return Intl.message(
      'Chọn hình thức cân',
      name: 'txt_choose_type_scale',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get txt_kg {
    return Intl.message(
      'Kg',
      name: 'txt_kg',
      desc: '',
      args: [],
    );
  }

  /// `tấn`
  String get txt_ton {
    return Intl.message(
      'tấn',
      name: 'txt_ton',
      desc: '',
      args: [],
    );
  }

  /// `cân lúa`
  String get title_scale_rice {
    return Intl.message(
      'cân lúa',
      name: 'title_scale_rice',
      desc: '',
      args: [],
    );
  }

  /// `Thu mua_Vận chuyển`
  String get title_thu_mua_van_chuyen {
    return Intl.message(
      'Thu mua_Vận chuyển',
      name: 'title_thu_mua_van_chuyen',
      desc: '',
      args: [],
    );
  }

  /// `Xóa bao lúa đã cân?`
  String get txt_warning_remove_scale {
    return Intl.message(
      'Xóa bao lúa đã cân?',
      name: 'txt_warning_remove_scale',
      desc: '',
      args: [],
    );
  }

  /// `HTX/THT`
  String get txt_htx {
    return Intl.message(
      'HTX/THT',
      name: 'txt_htx',
      desc: '',
      args: [],
    );
  }

  /// `HĐ/Dự án`
  String get txt_contact_project {
    return Intl.message(
      'HĐ/Dự án',
      name: 'txt_contact_project',
      desc: '',
      args: [],
    );
  }

  /// `HĐ/Dự án`
  String get txt_factory {
    return Intl.message(
      'HĐ/Dự án',
      name: 'txt_factory',
      desc: '',
      args: [],
    );
  }

  /// `Ngày thu hoạch`
  String get txt_ngay_thu_hoach {
    return Intl.message(
      'Ngày thu hoạch',
      name: 'txt_ngay_thu_hoach',
      desc: '',
      args: [],
    );
  }

  /// `Tải trọng kênh`
  String get txt_tai_trong_kenh {
    return Intl.message(
      'Tải trọng kênh',
      name: 'txt_tai_trong_kenh',
      desc: '',
      args: [],
    );
  }

  /// `Phân loại đại lý`
  String get txt_phan_loai_dai_ly {
    return Intl.message(
      'Phân loại đại lý',
      name: 'txt_phan_loai_dai_ly',
      desc: '',
      args: [],
    );
  }

  /// `KL vận chuyển`
  String get txt_kl_van_chuyen {
    return Intl.message(
      'KL vận chuyển',
      name: 'txt_kl_van_chuyen',
      desc: '',
      args: [],
    );
  }

  /// `Ngày có ghe`
  String get txt_ngay_co_ghe {
    return Intl.message(
      'Ngày có ghe',
      name: 'txt_ngay_co_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Ngày ghe về nhà máy`
  String get txt_ngay_ghe_ve_nha_may {
    return Intl.message(
      'Ngày ghe về nhà máy',
      name: 'txt_ngay_ghe_ve_nha_may',
      desc: '',
      args: [],
    );
  }

  /// `Đến ngày thu hoạch`
  String get txt_den_ngay_thu_hoach {
    return Intl.message(
      'Đến ngày thu hoạch',
      name: 'txt_den_ngay_thu_hoach',
      desc: '',
      args: [],
    );
  }

  /// `Vận chuyển về`
  String get txt_van_chuyen_ve {
    return Intl.message(
      'Vận chuyển về',
      name: 'txt_van_chuyen_ve',
      desc: '',
      args: [],
    );
  }

  /// `yyyy-MM-dd`
  String get txt_format_day {
    return Intl.message(
      'yyyy-MM-dd',
      name: 'txt_format_day',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết thu mua`
  String get txt_chi_tiet_thu_mua {
    return Intl.message(
      'Chi tiết thu mua',
      name: 'txt_chi_tiet_thu_mua',
      desc: '',
      args: [],
    );
  }

  /// `Sửa thông tin thu mua`
  String get txt_sua_chi_tiet_thu_mua {
    return Intl.message(
      'Sửa thông tin thu mua',
      name: 'txt_sua_chi_tiet_thu_mua',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin thu mua`
  String get txt_thong_tin_thu_mua {
    return Intl.message(
      'Thông tin thu mua',
      name: 'txt_thong_tin_thu_mua',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin ghe`
  String get txt_thong_tin_ghe {
    return Intl.message(
      'Thông tin ghe',
      name: 'txt_thong_tin_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Sửa thông tin ghe`
  String get txt_sua_thong_tin_ghe {
    return Intl.message(
      'Sửa thông tin ghe',
      name: 'txt_sua_thong_tin_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Khu ruộng`
  String get txt_khu_ruong {
    return Intl.message(
      'Khu ruộng',
      name: 'txt_khu_ruong',
      desc: '',
      args: [],
    );
  }

  /// `Nhập khu ruộng`
  String get txt_input_khu_ruong {
    return Intl.message(
      'Nhập khu ruộng',
      name: 'txt_input_khu_ruong',
      desc: '',
      args: [],
    );
  }

  /// `Giống`
  String get txt_giong {
    return Intl.message(
      'Giống',
      name: 'txt_giong',
      desc: '',
      args: [],
    );
  }

  /// `Nhập giống`
  String get txt_input_giong {
    return Intl.message(
      'Nhập giống',
      name: 'txt_input_giong',
      desc: '',
      args: [],
    );
  }

  /// `Tiêu chuẩn`
  String get txt_tieu_chuan {
    return Intl.message(
      'Tiêu chuẩn',
      name: 'txt_tieu_chuan',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tiêu chuẩn`
  String get txt_input_tieu_chuan {
    return Intl.message(
      'Nhập tiêu chuẩn',
      name: 'txt_input_tieu_chuan',
      desc: '',
      args: [],
    );
  }

  /// `Giá thương lượng`
  String get txt_gia_thuong_luong {
    return Intl.message(
      'Giá thương lượng',
      name: 'txt_gia_thuong_luong',
      desc: '',
      args: [],
    );
  }

  /// `Nhập giá thương lượng`
  String get txt_input_gia_thuong_luong {
    return Intl.message(
      'Nhập giá thương lượng',
      name: 'txt_input_gia_thuong_luong',
      desc: '',
      args: [],
    );
  }

  /// `Diện tích`
  String get txt_dien_tich {
    return Intl.message(
      'Diện tích',
      name: 'txt_dien_tich',
      desc: '',
      args: [],
    );
  }

  /// `Nhập diện tích`
  String get txt_input_dien_tich {
    return Intl.message(
      'Nhập diện tích',
      name: 'txt_input_dien_tich',
      desc: '',
      args: [],
    );
  }

  /// `Sản lượng cân`
  String get txt_san_luong_can {
    return Intl.message(
      'Sản lượng cân',
      name: 'txt_san_luong_can',
      desc: '',
      args: [],
    );
  }

  /// `Nhập sản lượng cân`
  String get txt_input_san_luong_can {
    return Intl.message(
      'Nhập sản lượng cân',
      name: 'txt_input_san_luong_can',
      desc: '',
      args: [],
    );
  }

  /// `Số bao`
  String get txt_so_bao {
    return Intl.message(
      'Số bao',
      name: 'txt_so_bao',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số bao`
  String get txt_input_so_bao {
    return Intl.message(
      'Nhập số bao',
      name: 'txt_input_so_bao',
      desc: '',
      args: [],
    );
  }

  /// `Khối lượng trừ bao`
  String get txt_khoi_luong_tru_bao {
    return Intl.message(
      'Khối lượng trừ bao',
      name: 'txt_khoi_luong_tru_bao',
      desc: '',
      args: [],
    );
  }

  /// `Nhập khối lượng trừ bao`
  String get txt_input_khoi_luong_tru_bao {
    return Intl.message(
      'Nhập khối lượng trừ bao',
      name: 'txt_input_khoi_luong_tru_bao',
      desc: '',
      args: [],
    );
  }

  /// `Tổng khối lượng trừ bao`
  String get txt_tong_khoi_luong_tru_bao {
    return Intl.message(
      'Tổng khối lượng trừ bao',
      name: 'txt_tong_khoi_luong_tru_bao',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tổng khối lượng trừ bao`
  String get txt_input_tong_khoi_luong_tru_bao {
    return Intl.message(
      'Nhập tổng khối lượng trừ bao',
      name: 'txt_input_tong_khoi_luong_tru_bao',
      desc: '',
      args: [],
    );
  }

  /// `Khối lượng trừ tạp chất`
  String get txt_khoi_luong_tru_tap_chat {
    return Intl.message(
      'Khối lượng trừ tạp chất',
      name: 'txt_khoi_luong_tru_tap_chat',
      desc: '',
      args: [],
    );
  }

  /// `Nhập khối lượng trừ tạp chất`
  String get txt_input_khoi_luong_tru_tap_chat {
    return Intl.message(
      'Nhập khối lượng trừ tạp chất',
      name: 'txt_input_khoi_luong_tru_tap_chat',
      desc: '',
      args: [],
    );
  }

  /// `Tổng khối lượng`
  String get txt_tong_khoi_luong {
    return Intl.message(
      'Tổng khối lượng',
      name: 'txt_tong_khoi_luong',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tổng khối lượng`
  String get txt_input_tong_khoi_luong {
    return Intl.message(
      'Nhập tổng khối lượng',
      name: 'txt_input_tong_khoi_luong',
      desc: '',
      args: [],
    );
  }

  /// `Thành tiền`
  String get txt_thanh_tien {
    return Intl.message(
      'Thành tiền',
      name: 'txt_thanh_tien',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số tiền`
  String get txt_input_thanh_tien {
    return Intl.message(
      'Nhập số tiền',
      name: 'txt_input_thanh_tien',
      desc: '',
      args: [],
    );
  }

  /// `Giá bốc xếp`
  String get txt_gia_boc_xep {
    return Intl.message(
      'Giá bốc xếp',
      name: 'txt_gia_boc_xep',
      desc: '',
      args: [],
    );
  }

  /// `Giá vận chuyển`
  String get txt_gia_van_chuyen {
    return Intl.message(
      'Giá vận chuyển',
      name: 'txt_gia_van_chuyen',
      desc: '',
      args: [],
    );
  }

  /// `Mã ghe`
  String get txt_ma_ghe {
    return Intl.message(
      'Mã ghe',
      name: 'txt_ma_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Số phương tiện`
  String get txt_so_phuong_tien {
    return Intl.message(
      'Số phương tiện',
      name: 'txt_so_phuong_tien',
      desc: '',
      args: [],
    );
  }

  /// `Tên chủ ghe`
  String get txt_ten_chu_ghe {
    return Intl.message(
      'Tên chủ ghe',
      name: 'txt_ten_chu_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên chủ ghe...`
  String get txt_input_ten_chu_ghe {
    return Intl.message(
      'Nhập tên chủ ghe...',
      name: 'txt_input_ten_chu_ghe',
      desc: '',
      args: [],
    );
  }

  /// `ĐT chủ ghe`
  String get txt_dt_chu_ghe {
    return Intl.message(
      'ĐT chủ ghe',
      name: 'txt_dt_chu_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại chủ ghe...`
  String get txt_input_dt_chu_ghe {
    return Intl.message(
      'Nhập số điện thoại chủ ghe...',
      name: 'txt_input_dt_chu_ghe',
      desc: '',
      args: [],
    );
  }

  /// `CMND`
  String get txt_cmnd {
    return Intl.message(
      'CMND',
      name: 'txt_cmnd',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số CMND/CCCD...`
  String get txt_input_cmnd {
    return Intl.message(
      'Nhập số CMND/CCCD...',
      name: 'txt_input_cmnd',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get txt_ngay_cap {
    return Intl.message(
      'Ngày cấp',
      name: 'txt_ngay_cap',
      desc: '',
      args: [],
    );
  }

  /// `Nơi cấp`
  String get txt_noi_cap {
    return Intl.message(
      'Nơi cấp',
      name: 'txt_noi_cap',
      desc: '',
      args: [],
    );
  }

  /// `Nhập nơi cấp CMND/CCCD...`
  String get txt_input_noi_cap {
    return Intl.message(
      'Nhập nơi cấp CMND/CCCD...',
      name: 'txt_input_noi_cap',
      desc: '',
      args: [],
    );
  }

  /// `Ngày lên ghe`
  String get txt_ngay_len_ghe {
    return Intl.message(
      'Ngày lên ghe',
      name: 'txt_ngay_len_ghe',
      desc: '',
      args: [],
    );
  }

  /// `Nông dân`
  String get txt_farmer {
    return Intl.message(
      'Nông dân',
      name: 'txt_farmer',
      desc: '',
      args: [],
    );
  }

  /// `Số phiếu`
  String get txt_no_ticket {
    return Intl.message(
      'Số phiếu',
      name: 'txt_no_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin chi tiết`
  String get txt_information_detail {
    return Intl.message(
      'Thông tin chi tiết',
      name: 'txt_information_detail',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách thiết bị`
  String get txt_lst_device {
    return Intl.message(
      'Danh sách thiết bị',
      name: 'txt_lst_device',
      desc: '',
      args: [],
    );
  }

  /// `Kêt nối cân thành công`
  String get txt_device_connect_success {
    return Intl.message(
      'Kêt nối cân thành công',
      name: 'txt_device_connect_success',
      desc: '',
      args: [],
    );
  }

  /// `Kết nối cân thất bại`
  String get txt_device_connect_failed {
    return Intl.message(
      'Kết nối cân thất bại',
      name: 'txt_device_connect_failed',
      desc: '',
      args: [],
    );
  }

  /// `Thống kê`
  String get txt_thong_ke {
    return Intl.message(
      'Thống kê',
      name: 'txt_thong_ke',
      desc: '',
      args: [],
    );
  }

  /// `Tổng bao bì`
  String get txt_tong_bao_bi {
    return Intl.message(
      'Tổng bao bì',
      name: 'txt_tong_bao_bi',
      desc: '',
      args: [],
    );
  }

  /// `Giá trung bình`
  String get txt_gia_trung_binh {
    return Intl.message(
      'Giá trung bình',
      name: 'txt_gia_trung_binh',
      desc: '',
      args: [],
    );
  }

  /// `Tổng tiền`
  String get txt_tong_tien {
    return Intl.message(
      'Tổng tiền',
      name: 'txt_tong_tien',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết cân lúa`
  String get txt_chi_tiet_can_lua {
    return Intl.message(
      'Chi tiết cân lúa',
      name: 'txt_chi_tiet_can_lua',
      desc: '',
      args: [],
    );
  }

  /// `cài đặt`
  String get txt_setting {
    return Intl.message(
      'cài đặt',
      name: 'txt_setting',
      desc: '',
      args: [],
    );
  }

  /// `Báo lỗi`
  String get txt_report_err {
    return Intl.message(
      'Báo lỗi',
      name: 'txt_report_err',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin`
  String get txt_infomation {
    return Intl.message(
      'Thông tin',
      name: 'txt_infomation',
      desc: '',
      args: [],
    );
  }

  /// `Fanpage`
  String get txt_fanpage {
    return Intl.message(
      'Fanpage',
      name: 'txt_fanpage',
      desc: '',
      args: [],
    );
  }

  /// `thông tin phần mềm`
  String get txt_app_infomation {
    return Intl.message(
      'thông tin phần mềm',
      name: 'txt_app_infomation',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi phát sinh hoặc vấn đề muốn hỗ trợ`
  String get txt_report_err_desc1 {
    return Intl.message(
      'Lỗi phát sinh hoặc vấn đề muốn hỗ trợ',
      name: 'txt_report_err_desc1',
      desc: '',
      args: [],
    );
  }

  /// `gửi báo cáo`
  String get txt_send_report {
    return Intl.message(
      'gửi báo cáo',
      name: 'txt_send_report',
      desc: '',
      args: [],
    );
  }

  /// `* Hãy để lại số điện thoại để chúng tôi có thể liên hệ nếu bạn cần hỗ trợ`
  String get txt_report_err_desc {
    return Intl.message(
      '* Hãy để lại số điện thoại để chúng tôi có thể liên hệ nếu bạn cần hỗ trợ',
      name: 'txt_report_err_desc',
      desc: '',
      args: [],
    );
  }

  /// `Tạo bảng tính`
  String get txt_title_tao_bang_tinh {
    return Intl.message(
      'Tạo bảng tính',
      name: 'txt_title_tao_bang_tinh',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cân`
  String get txt_ngay_can {
    return Intl.message(
      'Ngày cân',
      name: 'txt_ngay_can',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh`
  String get txt_tinh {
    return Intl.message(
      'Tỉnh',
      name: 'txt_tinh',
      desc: '',
      args: [],
    );
  }

  /// `Huyện`
  String get txt_huyen {
    return Intl.message(
      'Huyện',
      name: 'txt_huyen',
      desc: '',
      args: [],
    );
  }

  /// `Xã`
  String get txt_xa {
    return Intl.message(
      'Xã',
      name: 'txt_xa',
      desc: '',
      args: [],
    );
  }

  /// `Số/Ấp`
  String get txt_so_ap {
    return Intl.message(
      'Số/Ấp',
      name: 'txt_so_ap',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số/ấp cụ thể`
  String get txt_input_so_ap {
    return Intl.message(
      'Nhập số/ấp cụ thể',
      name: 'txt_input_so_ap',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get txt_ghi_chu {
    return Intl.message(
      'Ghi chú',
      name: 'txt_ghi_chu',
      desc: '',
      args: [],
    );
  }

  /// `Nhập ghi chú (không bắt buộc)...`
  String get txt_input_ghi_chu {
    return Intl.message(
      'Nhập ghi chú (không bắt buộc)...',
      name: 'txt_input_ghi_chu',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo`
  String get txt_tiep_theo {
    return Intl.message(
      'Tiếp theo',
      name: 'txt_tiep_theo',
      desc: '',
      args: [],
    );
  }

  /// `Tìm theo tên...`
  String get txt_tim_theo_ten {
    return Intl.message(
      'Tìm theo tên...',
      name: 'txt_tim_theo_ten',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày để lọc`
  String get txt_chon_ngay_de_loc {
    return Intl.message(
      'Chọn ngày để lọc',
      name: 'txt_chon_ngay_de_loc',
      desc: '',
      args: [],
    );
  }

  /// `Nông dân`
  String get txt_nong_dan {
    return Intl.message(
      'Nông dân',
      name: 'txt_nong_dan',
      desc: '',
      args: [],
    );
  }

  /// `Số lượng phiếu cân`
  String get txt_sl_phieu_can {
    return Intl.message(
      'Số lượng phiếu cân',
      name: 'txt_sl_phieu_can',
      desc: '',
      args: [],
    );
  }

  /// `phiếu`
  String get txt_phieu {
    return Intl.message(
      'phiếu',
      name: 'txt_phieu',
      desc: '',
      args: [],
    );
  }

  /// `Số phiếu`
  String get txt_so_phieu {
    return Intl.message(
      'Số phiếu',
      name: 'txt_so_phieu',
      desc: '',
      args: [],
    );
  }

  /// `Cân lúa`
  String get txt_can_lua {
    return Intl.message(
      'Cân lúa',
      name: 'txt_can_lua',
      desc: '',
      args: [],
    );
  }

  /// `Phản hồi thành công !!`
  String get txt_report_success {
    return Intl.message(
      'Phản hồi thành công !!',
      name: 'txt_report_success',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn item để xóa !!`
  String get txt_not_choose_item_remove {
    return Intl.message(
      'Vui lòng chọn item để xóa !!',
      name: 'txt_not_choose_item_remove',
      desc: '',
      args: [],
    );
  }

  /// `Ngày`
  String get txt_ngay {
    return Intl.message(
      'Ngày',
      name: 'txt_ngay',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập khối lượng lớn hơn 0`
  String get txt_err_update_weight_is_zero {
    return Intl.message(
      'Vui lòng nhập khối lượng lớn hơn 0',
      name: 'txt_err_update_weight_is_zero',
      desc: '',
      args: [],
    );
  }

  /// `Đã có lỗi. Vui lòng thử lại !!`
  String get txt_err_msg {
    return Intl.message(
      'Đã có lỗi. Vui lòng thử lại !!',
      name: 'txt_err_msg',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đầy đủ thông tin !!`
  String get txt_err_required_field {
    return Intl.message(
      'Vui lòng nhập đầy đủ thông tin !!',
      name: 'txt_err_required_field',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận quay về thu mua`
  String get txt_confirm_back_thumua {
    return Intl.message(
      'Xác nhận quay về thu mua',
      name: 'txt_confirm_back_thumua',
      desc: '',
      args: [],
    );
  }

  /// `Về thu mua`
  String get txt_back_thumua {
    return Intl.message(
      'Về thu mua',
      name: 'txt_back_thumua',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc chuyển sang Cân thủ công`
  String get txt_change_manual_scale {
    return Intl.message(
      'Hoặc chuyển sang Cân thủ công',
      name: 'txt_change_manual_scale',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth is disable`
  String get txt_bluetooth_disable {
    return Intl.message(
      'Bluetooth is disable',
      name: 'txt_bluetooth_disable',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá`
  String get txt_don_gia {
    return Intl.message(
      'Đơn giá',
      name: 'txt_don_gia',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá lúa`
  String get txt_don_gia_lua {
    return Intl.message(
      'Đơn giá lúa',
      name: 'txt_don_gia_lua',
      desc: '',
      args: [],
    );
  }

  /// `Tạo số phiếu cân`
  String get txt_tao_so_phieu_can {
    return Intl.message(
      'Tạo số phiếu cân',
      name: 'txt_tao_so_phieu_can',
      desc: '',
      args: [],
    );
  }

  /// `Loại`
  String get txt_type {
    return Intl.message(
      'Loại',
      name: 'txt_type',
      desc: '',
      args: [],
    );
  }

  /// `Phiếu cân bổ sung`
  String get txt_type_offline_ticket {
    return Intl.message(
      'Phiếu cân bổ sung',
      name: 'txt_type_offline_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Xóa`
  String get txt_del {
    return Intl.message(
      'Xóa',
      name: 'txt_del',
      desc: '',
      args: [],
    );
  }

  /// `Sửa`
  String get txt_edit {
    return Intl.message(
      'Sửa',
      name: 'txt_edit',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận xóa !`
  String get txt_warning_del {
    return Intl.message(
      'Xác nhận xóa !',
      name: 'txt_warning_del',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận đồng bộ dữ liệu phiếu cân !`
  String get txt_warning_sync_master_data {
    return Intl.message(
      'Xác nhận đồng bộ dữ liệu phiếu cân !',
      name: 'txt_warning_sync_master_data',
      desc: '',
      args: [],
    );
  }

  /// `Thêm phiếu cân mới`
  String get txt_title_add_new_ticket {
    return Intl.message(
      'Thêm phiếu cân mới',
      name: 'txt_title_add_new_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Đóng phiếu cân`
  String get txt_sync_to_server {
    return Intl.message(
      'Đóng phiếu cân',
      name: 'txt_sync_to_server',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận đóng phiếu cân`
  String get txt_warning_close_ticket_title {
    return Intl.message(
      'Xác nhận đóng phiếu cân',
      name: 'txt_warning_close_ticket_title',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ phiếu cân về server và xóa phiếu cân hiện tại !!`
  String get txt_warning_close_ticket_msg {
    return Intl.message(
      'Đồng bộ phiếu cân về server và xóa phiếu cân hiện tại !!',
      name: 'txt_warning_close_ticket_msg',
      desc: '',
      args: [],
    );
  }

  /// `Đóng phiếu cân thành công !!`
  String get txt_close_ticket_success {
    return Intl.message(
      'Đóng phiếu cân thành công !!',
      name: 'txt_close_ticket_success',
      desc: '',
      args: [],
    );
  }

  /// `Bao`
  String get txt_bao {
    return Intl.message(
      'Bao',
      name: 'txt_bao',
      desc: '',
      args: [],
    );
  }

  /// `Điều kiện đồng bộ`
  String get txt_sync_condition {
    return Intl.message(
      'Điều kiện đồng bộ',
      name: 'txt_sync_condition',
      desc: '',
      args: [],
    );
  }

  /// `Nhập trọng lượng bao lúa`
  String get txt_nhap_trong_luong_bao_lua {
    return Intl.message(
      'Nhập trọng lượng bao lúa',
      name: 'txt_nhap_trong_luong_bao_lua',
      desc: '',
      args: [],
    );
  }

  /// `Bao tiếp`
  String get txt_bao_tiep {
    return Intl.message(
      'Bao tiếp',
      name: 'txt_bao_tiep',
      desc: '',
      args: [],
    );
  }

  /// `Từ ngày`
  String get txt_tu_ngay {
    return Intl.message(
      'Từ ngày',
      name: 'txt_tu_ngay',
      desc: '',
      args: [],
    );
  }

  /// `Đến ngày`
  String get txt_den_ngay {
    return Intl.message(
      'Đến ngày',
      name: 'txt_den_ngay',
      desc: '',
      args: [],
    );
  }

  /// `Dữ liệu cân`
  String get txt_du_lieu_can {
    return Intl.message(
      'Dữ liệu cân',
      name: 'txt_du_lieu_can',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin phiếu cân`
  String get txt_thong_tin_phieu_can {
    return Intl.message(
      'Thông tin phiếu cân',
      name: 'txt_thong_tin_phieu_can',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá thưởng dư lượng`
  String get txt_don_gia_thuong_du_luong {
    return Intl.message(
      'Đơn giá thưởng dư lượng',
      name: 'txt_don_gia_thuong_du_luong',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get txt_logout {
    return Intl.message(
      'Đăng xuất',
      name: 'txt_logout',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại`
  String get txt_err_sdt_empty {
    return Intl.message(
      'Vui lòng nhập số điện thoại',
      name: 'txt_err_sdt_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu`
  String get txt_err_pass_empty {
    return Intl.message(
      'Vui lòng nhập mật khẩu',
      name: 'txt_err_pass_empty',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu không đúng`
  String get txt_err_repass_wrong {
    return Intl.message(
      'Xác nhận mật khẩu không đúng',
      name: 'txt_err_repass_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập họ tên`
  String get txt_err_hoten_empty {
    return Intl.message(
      'Vui lòng nhập họ tên',
      name: 'txt_err_hoten_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn tỉnh`
  String get txt_err_tinh_empty {
    return Intl.message(
      'Vui lòng chọn tỉnh',
      name: 'txt_err_tinh_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn huyện`
  String get txt_err_huyen_empty {
    return Intl.message(
      'Vui lòng chọn huyện',
      name: 'txt_err_huyen_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn xã`
  String get txt_err_xa_empty {
    return Intl.message(
      'Vui lòng chọn xã',
      name: 'txt_err_xa_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập khu ruông`
  String get txt_err_ruong_empty {
    return Intl.message(
      'Vui lòng nhập khu ruông',
      name: 'txt_err_ruong_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn ngày cân`
  String get txt_err_ngay_can_empty {
    return Intl.message(
      'Vui lòng chọn ngày cân',
      name: 'txt_err_ngay_can_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập phiếu cân`
  String get txt_err_so_phieu_empty {
    return Intl.message(
      'Vui lòng nhập phiếu cân',
      name: 'txt_err_so_phieu_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập giống`
  String get txt_err_giong_empty {
    return Intl.message(
      'Vui lòng nhập giống',
      name: 'txt_err_giong_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đơn giá`
  String get txt_err_don_gia_empty {
    return Intl.message(
      'Vui lòng nhập đơn giá',
      name: 'txt_err_don_gia_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập diện tích`
  String get txt_err_dien_tich_empty {
    return Intl.message(
      'Vui lòng nhập diện tích',
      name: 'txt_err_dien_tich_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập khối lượng trừ bao`
  String get txt_err_kl_tru_bao_empty {
    return Intl.message(
      'Vui lòng nhập khối lượng trừ bao',
      name: 'txt_err_kl_tru_bao_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập khối lượng trừ tạp chất`
  String get txt_err_kl_tru_tap_chap_empty {
    return Intl.message(
      'Vui lòng nhập khối lượng trừ tạp chất',
      name: 'txt_err_kl_tru_tap_chap_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tiêu chuẩn`
  String get txt_err_kl_tieu_chuan_empty {
    return Intl.message(
      'Vui lòng nhập tiêu chuẩn',
      name: 'txt_err_kl_tieu_chuan_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số phương tiện`
  String get txt_err_so_phuong_tien_empty {
    return Intl.message(
      'Vui lòng nhập số phương tiện',
      name: 'txt_err_so_phuong_tien_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tên chủ ghê`
  String get txt_err_ten_chu_ghe_empty {
    return Intl.message(
      'Vui lòng nhập tên chủ ghê',
      name: 'txt_err_ten_chu_ghe_empty',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập điện thoại chủ ghe`
  String get txt_err_dt_chu_ghe_empty {
    return Intl.message(
      'Vui lòng nhập điện thoại chủ ghe',
      name: 'txt_err_dt_chu_ghe_empty',
      desc: '',
      args: [],
    );
  }

  /// `Mã xác thực không chính xác`
  String get txt_err_sms_otb_invalid {
    return Intl.message(
      'Mã xác thực không chính xác',
      name: 'txt_err_sms_otb_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký thành công !!`
  String get txt_register_success {
    return Intl.message(
      'Đăng ký thành công !!',
      name: 'txt_register_success',
      desc: '',
      args: [],
    );
  }

  /// `Dữ liệu cân rỗng`
  String get txt_du_lieu_can_rong {
    return Intl.message(
      'Dữ liệu cân rỗng',
      name: 'txt_du_lieu_can_rong',
      desc: '',
      args: [],
    );
  }

  /// `Đóng cân lúa`
  String get txt_hoan_thanh_can_lua {
    return Intl.message(
      'Đóng cân lúa',
      name: 'txt_hoan_thanh_can_lua',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get txt_title_forgot_pass {
    return Intl.message(
      'Quên mật khẩu',
      name: 'txt_title_forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Gửi SMS OTB`
  String get txt_send_otb {
    return Intl.message(
      'Gửi SMS OTB',
      name: 'txt_send_otb',
      desc: '',
      args: [],
    );
  }

  /// `SMS OTB`
  String get txt_sms_otb {
    return Intl.message(
      'SMS OTB',
      name: 'txt_sms_otb',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại đã đăng ký, hệ thống sẽ xác thực việc thay đổi mật khẩu`
  String get txt_send_otb_decs {
    return Intl.message(
      'Nhập số điện thoại đã đăng ký, hệ thống sẽ xác thực việc thay đổi mật khẩu',
      name: 'txt_send_otb_decs',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ dữ liệu`
  String get txt_sync_data {
    return Intl.message(
      'Đồng bộ dữ liệu',
      name: 'txt_sync_data',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
