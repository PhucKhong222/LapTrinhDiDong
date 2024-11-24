import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  CuaHang(this._tenCuaHang, this._diaChi) {
    if (_tenCuaHang.isEmpty || _diaChi.isEmpty) {
      throw Exception('Tên và địa chỉ cửa hàng không được rỗng');
    }
  }

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => List.unmodifiable(_danhSachDienThoai);
  List<HoaDon> get danhSachHoaDon => List.unmodifiable(_danhSachHoaDon);

  //Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    if (_danhSachDienThoai.any((dt) => dt.maDienThoai == dienThoai.maDienThoai)) {
      throw Exception('Mã điện thoại đã tồn tại');
    }
    _danhSachDienThoai.add(dienThoai);
  }

  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    final index = _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index == -1) {
      throw Exception('Không tìm thấy điện thoại');
    }
    _danhSachDienThoai[index] = dienThoaiMoi;
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    final dienThoai = timDienThoaiTheoMa(maDienThoai);
    if (dienThoai != null) {
      dienThoai.setTrangThai(false);
    }
  }

  DienThoai? timDienThoaiTheoMa(String ma) {
    try {
      return _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == ma);
    } catch (e) {
      return null;
    }
  }

  List<DienThoai> timDienThoaiTheoTen(String ten) {
    return _danhSachDienThoai
        .where((dt) => dt.tenDienThoai.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  List<DienThoai> timDienThoaiTheoHang(String hang) {
    return _danhSachDienThoai
        .where((dt) => dt.hangSanXuat.toLowerCase() == hang.toLowerCase())
        .toList();
  }

  //Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    //Kiểm tra tồn kho
    final dienThoai = hoaDon.dienThoai;
    if (!dienThoai.coTheBan()) {
      throw Exception('Điện thoại không thể bán');
    }

    if (hoaDon.soLuongMua > dienThoai.soLuongTonKho) {
      throw Exception('Số lượng mua vượt quá tồn kho');
    }

    //Cập nhật tồn kho
    dienThoai.setSoLuongTonKho(dienThoai.soLuongTonKho - hoaDon.soLuongMua);
    
    //Thêm hóa đơn
    _danhSachHoaDon.add(hoaDon);
  }

  HoaDon? timHoaDonTheoMa(String ma) {
    try {
      return _danhSachHoaDon.firstWhere((hd) => hd.maHoaDon == ma);
    } catch (e) {
      return null;
    }
  }

  List<HoaDon> timHoaDonTheoNgay(DateTime ngay) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.year == ngay.year &&
          hd.ngayBan.month == ngay.month &&
          hd.ngayBan.day == ngay.day;
    }).toList();
  }

  List<HoaDon> timHoaDonTheoKhachHang(String tenKhachHang) {
    return _danhSachHoaDon
        .where((hd) => hd.tenKhachHang.toLowerCase().contains(tenKhachHang.toLowerCase()))
        .toList();
  }

  //Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (sum, hd) => sum + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (sum, hd) => sum + hd.tinhLoiNhuanThucTe());
  }

  List<Map<String, dynamic>> thongKeTopBanChay([int top = 5]) {
    Map<String, int> soLuongBanTheoDienThoai = {};
    
    //Tính tổng số lượng bán của từng điện thoại
    for (var hoaDon in _danhSachHoaDon) {
      final maDienThoai = hoaDon.dienThoai.maDienThoai;
      soLuongBanTheoDienThoai[maDienThoai] = 
          (soLuongBanTheoDienThoai[maDienThoai] ?? 0) + hoaDon.soLuongMua;
    }

    //Chuyển đổi thành danh sách và sắp xếp
    List<Map<String, dynamic>> ketQua = soLuongBanTheoDienThoai.entries
    .map((entry) {
      final dienThoai = timDienThoaiTheoMa(entry.key);
      return {
        'dienThoai': dienThoai,
        'soLuongBan': entry.value,
      };
    })
    .toList()
    ..sort((a, b) => (b['soLuongBan'] as int).compareTo(a['soLuongBan'] as int));

    //Lấy top sản phẩm bán chạy
    return ketQua.take(top).toList();
  }

  List<Map<String, dynamic>> thongKeTonKho() {
    return _danhSachDienThoai
        .where((dt) => dt.trangThai) // Chỉ lấy các sản phẩm đang kinh doanh
        .map((dt) => {
              'dienThoai': dt,
              'tonKho': dt.soLuongTonKho,
              'giaTriTon': dt.soLuongTonKho * dt.giaNhap,
            })
        .toList();
  }

  //Phương thức hiển thị thông tin
  void hienThiDanhSachDienThoai() {
    print('\nDanh sách điện thoại:');
    for (var dt in _danhSachDienThoai) {
      print(dt.toString());
      print('-' * 50);
    }
  }

  void hienThiDanhSachHoaDon() {
    print('\nDanh sách hóa đơn:');
    for (var hd in _danhSachHoaDon) {
      print(hd.toString());
      print('-' * 50);
    }
  }
}