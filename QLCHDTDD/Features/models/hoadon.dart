import 'dienthoai.dart';

class HoaDon {
  String? _maHoaDon;
  DateTime? _ngayBan;
  DienThoai? _dienThoai;
  int? _soLuongMua;
  double? _giaBanThucTe;
  String? _tenKhachHang;
  String? _soDienThoaiKhach;

  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua, this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach,) 
  {
    //Validate
    setMaHoaDon(_maHoaDon);
    setNgayBan(_ngayBan);
    setDienThoai(_dienThoai);
    setSoLuongMua(_soLuongMua);
    setGiaBanThucTe(_giaBanThucTe);
    setTenKhachHang(_tenKhachHang);
    setSoDienThoaiKhach(_soDienThoaiKhach);
  }

  //Getters
  String get maHoaDon => _maHoaDon ?? '';
  DateTime get ngayBan => _ngayBan ?? DateTime.now();
  DienThoai get dienThoai => _dienThoai!;
  int get soLuongMua => _soLuongMua ?? 0;
  double get giaBanThucTe => _giaBanThucTe ?? 0;
  String get tenKhachHang => _tenKhachHang ?? '';
  String get soDienThoaiKhach => _soDienThoaiKhach ?? '';

  //Setters với validation
  void setMaHoaDon(String? ma) {
    if (ma == null || ma.isEmpty) {
      throw Exception('Mã hóa đơn không được rỗng');
    }
    if (!RegExp(r'^HD-\d{3}$').hasMatch(ma)) {
      throw Exception('Mã hóa đơn phải có định dạng HD-XXX');
    }
    _maHoaDon = ma;
  }

  void setNgayBan(DateTime? ngay) {
    if (ngay == null) {
      throw Exception('Ngày bán không được rỗng');
    }
    if (ngay.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = ngay;
  }

  void setDienThoai(DienThoai? dt) {
    if (dt == null) {
      throw Exception('Điện thoại không được rỗng');
    }
    if (!dt.coTheBan()) {
      throw Exception('Điện thoại không thể bán');
    }
    _dienThoai = dt;
  }

  void setSoLuongMua(int? soLuong) {
    if (soLuong == null || soLuong <= 0) {
      throw Exception('Số lượng mua phải lớn hơn 0');
    }
    if (_dienThoai != null && soLuong > _dienThoai!.soLuongTonKho) {
      throw Exception('Số lượng mua không được lớn hơn tồn kho');
    }
    _soLuongMua = soLuong;
  }

  void setGiaBanThucTe(double? gia) {
    if (gia == null || gia <= 0) {
      throw Exception('Giá bán thực tế phải lớn hơn 0');
    }
    _giaBanThucTe = gia;
  }

  void setTenKhachHang(String? ten) {
    if (ten == null || ten.isEmpty) {
      throw Exception('Tên khách hàng không được rỗng');
    }
    _tenKhachHang = ten;
  }

  void setSoDienThoaiKhach(String? sdt) {
    if (sdt == null || sdt.isEmpty) {
      throw Exception('Số điện thoại khách không được rỗng');
    }
    if (!RegExp(r'^0\d{9}$').hasMatch(sdt)) {
      throw Exception('Số điện thoại không hợp lệ');
    }
    _soDienThoaiKhach = sdt;
  }

  //Phương thức tính tổng tiền
  double tinhTongTien() {
    return (_soLuongMua ?? 0) * (_giaBanThucTe ?? 0);
  }

  //Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    if (_dienThoai == null) return 0;
    return (_giaBanThucTe ?? 0 - _dienThoai!.giaNhap) * (_soLuongMua ?? 0);
  }

  //Phương thức hiển thị thông tin hóa đơn
  @override
  String toString() {
    return '''
    Mã hóa đơn: $_maHoaDon
    Ngày bán: ${_ngayBan?.toString()}
    Điện thoại: ${_dienThoai?.tenDienThoai}
    Số lượng mua: $_soLuongMua
    Giá bán thực tế: $_giaBanThucTe
    Tổng tiền: ${tinhTongTien()}
    Khách hàng: $_tenKhachHang
    Số điện thoại: $_soDienThoaiKhach
    ''';
  }
}