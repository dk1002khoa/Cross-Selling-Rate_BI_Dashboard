# power_bi_project
Power BI Dashboard
*/ Tóm tắt:
1/ Rule tính bán kèm với LK: Lấy theo SĐT và Ngày tạo phiếu -> Cùng ngày cùng SĐT sẽ tính là Bán kèm
2/ Rule tính bán kèm với MÁY CŨ: Lấy theo SĐT và Ngày tạo phiếu -> Cùng ngày cùng SĐT sẽ tính là Bán kèm
3/ Rule tính bán lẻ = [Tổng sl bán pk] - [Tổng sl bán kèm]
4/ Rule tính bán chính = Tổng SL (LK/MÁY CŨ) bán ra
5/ Không lấy khác hàng BH_KHCPS, BH_BHRVRN
6/ Chỉ lấy các phương thức sau Nhập trả, Bán lẻ, Xuất LK SCDV-BH, Nhập đổi, Xuất trả (bán), Đơn đến cửa hàng, Đơn giao hàng, Xuất đổi
7/ Tần suất update 2 tiếng/1 lần. Data xem theo ngày D. Lịch update: Từ 12h40, 14h40, 16h40, 18h40, 20h40, 22h40. Chốt số cuối ngày 22h40 
*/

*/ Phân tích: 
1/ Bán kèm với Linh kiện (LK) và Máy cũ:
Dựa trên SĐT và Ngày tạo phiếu.
Nếu cùng ngày và cùng SĐT => tính là bán kèm.
→ Mục tiêu: xác định trường hợp khách mua nhiều sản phẩm trong cùng 1 ngày, để xác định đâu là hàng bán kèm (có thể là phụ kiện mua cùng máy chính).
2/ Tính Bán lẻ:
Công thức:
Bán lẻ = Tổng số lượng phụ kiện bán - Số lượng bán kèm
→ Mục tiêu: Chỉ những phụ kiện bán độc lập (không đi kèm máy) mới được tính là bán lẻ thực sự. Tính tỷ lệ bán lẻ thực sự
3/ Kết quả cuối cùng: 
Phân loại rõ bán chính / bán kèm / bán lẻ
Đảm bảo loại bỏ các giao dịch không hợp lệ
Tự động hóa cập nhật dữ liệu bán hàng theo khung giờ
Chuẩn hóa dữ liệu phục vụ báo cáo nội bộ, đánh giá hiệu suất bán hàng hoặc hiệu quả nhân viên.
