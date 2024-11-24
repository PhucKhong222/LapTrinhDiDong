import '../models/cuahang.dart';
import '../models/dienthoai.dart';
import '../models/hoadon.dart';

void main() {
  try {
    //Tạo cửa hàng
    final cuaHang = CuaHang('Mobile Store', '123 ABC Street');
    print('Đã tạo cửa hàng: ${cuaHang.tenCuaHang}');

    //thêm điện thoại
    final dienThoai1 = DienThoai(
      'DT-001',
      'iPhone 13',
      'Apple',
      20000000,
      25000000,
      10,
      true,
    );

    final dienThoai2 = DienThoai(
      'DT-002',
      'Samsung S21',
      'Samsung',
      15000000,
      19000000,
      15,
      true,
    );

    cuaHang.themDienThoai(dienThoai1);
    cuaHang.themDienThoai(dienThoai2);
    print('\nĐã thêm các điện thoại mẫu');
    cuaHang.hienThiDanhSachDienThoai();

    //tạo hóa đơn
    final hoaDon1 = HoaDon(
      'HD-001',
      DateTime.now(),
      dienThoai1,
      2,
      25000000,
      'Nguyễn Văn A',
      '0123456789',
    );

    cuaHang.taoHoaDon(hoaDon1);
    print('\nĐã tạo hóa đơn mẫu');
    cuaHang.hienThiDanhSachHoaDon();

    //thống kê
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1);
    final endDate = DateTime(now.year, now.month + 1, 0);

    print('\nThống kê tháng ${now.month}/${now.year}:');
    print('Tổng doanh thu: ${cuaHang.tinhTongDoanhThu(startDate, endDate)}');
    print('Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(startDate, endDate)}');

    print('\nTop sản phẩm bán chạy:');
    final topBanChay = cuaHang.thongKeTopBanChay();
    for (var item in topBanChay) {
      print('${item['dienThoai'].tenDienThoai}: ${item['soLuongBan']} chiếc');
    }

    print('\nThống kê tồn kho:');
    final tonKho = cuaHang.thongKeTonKho();
    for (var item in tonKho) {
      final dt = item['dienThoai'] as DienThoai;
      print('${dt.tenDienThoai}: ${item['tonKho']} chiếc (Giá trị: ${item['giaTriTon']})');
    }

  } catch (e) {
    print('Lỗi: $e');
  }
}