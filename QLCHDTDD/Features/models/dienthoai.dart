//Khởi tạo class
class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai = true;

  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai,) 
  {
    //Validate
    setMaDienThoai(_maDienThoai);
    setTenDienThoai(_tenDienThoai);
    setHangSanXuat(_hangSanXuat);
    setGiaNhap(_giaNhap);
    setGiaBan(_giaBan);
    setSoLuongTonKho(_soLuongTonKho);
  }

  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //Setters với validation
  void setMaDienThoai(String ma) {
    if (ma.isEmpty) {
      throw Exception('Mã điện thoại không được rỗng');
    }
    if (!_maDienThoai.startsWith('DT-')) {
      throw Exception('Mã điện thoại phải có định dạng DT-XXX');
    }
    _maDienThoai = ma;
  }

  void setTenDienThoai(String ten) {
    if (ten.isEmpty) {
      throw Exception('Tên điện thoại không được rỗng');
    }
    _tenDienThoai = ten;
  }

  void setHangSanXuat(String hang) {
    if (hang.isEmpty) {
      throw Exception('Hãng sản xuất không được rỗng');
    }
    _hangSanXuat = hang;
  }

  void setGiaNhap(double gia) {
    if (gia <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    _giaNhap = gia;
  }

  void setGiaBan(double gia) {
    if (gia <= 0) {
      throw Exception('Giá bán phải lớn hơn 0');
    }
    if (gia <= (_giaNhap)) {
      throw Exception('Giá bán phải lớn hơn giá nhập');
    }
    _giaBan = gia;
  }

  void setSoLuongTonKho(int soLuong) {
    if (soLuong < 0) {
      throw Exception('Số lượng tồn kho phải lớn hơn hoặc bằng 0');
    }
    _soLuongTonKho = soLuong;
  }

  void setTrangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  //Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() {
    return (_giaBan) - (_giaNhap);
  }

  //Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _trangThai && (_soLuongTonKho) > 0;
  }

  //Phương thức hiển thị thông tin
  @override
  String toString() {
    return '''
    Mã điện thoại: $_maDienThoai
    Tên điện thoại: $_tenDienThoai
    Hãng sản xuất: $_hangSanXuat
    Giá nhập: $_giaNhap
    Giá bán: $_giaBan
    Số lượng tồn kho: $_soLuongTonKho
    Trạng thái: ${_trangThai ? 'Đang kinh doanh' : 'Ngừng kinh doanh'}
    ''';
  }
}