import '../models/lop_hoc.dart';
import '../models/sinh_vien.dart';

void main(){
    var SV = SinhVien('Nguyễn Văn A', 21, 'SV002', 9.0);
    print('Test getter: ${SV.hoTen}');
    SV.hoTen = 'Nguyễn Văn B';
    print('Sau khi set: ${SV.hoTen}');
    print('Xếp loại: ${SV.XepLoai()}');

    var lop = LopHoc('21DTHD5');
    lop.themSinhVien(SinhVien('Nguyễn Văn A', 21, 'SV002', 9.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn B', 21, 'SV003', 7.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn C', 21, 'SV004', 5.0));
    lop.themSinhVien(SinhVien('Nguyễn Văn D', 21, 'SV005', 4.0));
    lop.HienThiDS();
  }