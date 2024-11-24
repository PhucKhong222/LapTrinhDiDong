import 'Sach.dart';
import 'DocGia.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print("Thêm sách '${sach.tenSach}' thành công.");
  }

  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print("Thêm độc giả '${docGia.hoTen}' thành công.");
  }

  void hienThiDSS() {
    print("Danh sách sách:");
    for (var sach in _danhSachSach) {
      sach.HienThiTT();
      print("-------------------");
    }
  }

  void hienThiDSDG() {
    print("Danh sách độc giả:");
    for (var docGia in _danhSachDocGia) {
      print("Mã độc giả: ${docGia.maDocGia}");
      print("Họ tên: ${docGia.hoTen}");
      print("Sách đang mượn:");
      for (var sach in docGia.danhSachMuon) {
        print("- ${sach.tenSach}");
      }
      print("-------------------");
    }
  }
}