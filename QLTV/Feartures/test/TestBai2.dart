import '../models/Sach.dart';
import '../models/DocGia.dart';
import '../models/ThuVien.dart';
void main() {
  var thuVien = ThuVien();

  var sach1 = Sach("S001", "1001 Bài", "Nguyễn Văn A", false);
  var sach2 = Sach("S002", "1002 bài", "Trần Văn B", false);
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  var docGia1 = DocGia("DG001", "Lê Văn C");
  thuVien.themDocGia(docGia1);

  docGia1.MuonSach(sach1);
  docGia1.MuonSach(sach2);

  thuVien.hienThiDSDG();
  thuVien.hienThiDSDG();

  docGia1.TraSach(sach1);

  thuVien.hienThiDSDG();
  thuVien.hienThiDSDG();
}