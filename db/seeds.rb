10.times do |n|
  role_id = "161106056#{n+1}"
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(
    role_id: role_id,
    name: name,
    email: email,
    password: password,
    password_confirmation: password)
end
Department.create!(
  name:"Công Tác sinh Viên"
)
Department.create!(
  name:"Đào Tạo"
)
Department.create!(
  name:"Tài Chính - Kế Toán"
)
Department.create!(
  name:"Y Tế"
)
Department.create!(
  name:"Cơ Sở Vật Chất"
)
User.create!(
    role: 1,
    role_id: "123456789",
    name: "Tran Van A",
    password: "123456",
    password_confirmation: "123456")

6.times do |n|
    word1 = Document.create!( 
      title: "Đơn Xác Nhận",
      content: "(Về việc sinh viên chấp hành quy định chính sách, Pháp luật của Đảng, Nhà nước và của Trường trong thời gian học tập tại Trường)",
      department_id:1)
      word1.words.attach(
        io: File.open("public/words/congtacsinhvien.doc"),
        filename: "ĐƠN XÁC NHẬN (Về việc sinh viên chấp hành quy định chính sách, Pháp luật của Đảng, Nhà nước và của Trường trong thời gian học tập tại Trường).doc"
      )
    word2 = Document.create!(
      title: "Đơn Xin Cấp Bản Sao Kết Quả Học Tập",
      content: "",
      department_id:2,
      form: true)
      word2.words.attach(
        io: File.open("public/words/daotao.doc"),
        filename: "ĐƠN XIN CẤP BẢN SAO KẾT QUẢ HỌC TẬP.doc"
      )    
    word3 = Document.create!(
      title: "Giấy Đăng Ký Sử Dụng Phòng Học",
      content: "",
      department_id:5)
      word3.words.attach(
        io: File.open("public/words/cosovatchat.doc"),
        filename: "GIẤY ĐĂNG KÝ SỬ DỤNG PHÒNG HỌC.doc"
      )   
    word4 = Document.create!(
      title:  "Giấy Đề Nghị",
      content: "(Về việc kiểm tra, phản ánh sai lệch thông tin về học phí trên hệ thống)",
      department_id:3)
      word4.words.attach(
        io: File.open("public/words/taichinhketoan.doc"),
        filename: "GIẤY ĐỀ NGHỊ (Về việc kiểm tra, phản ánh sai lệch thông tin về học phí trên hệ thống).doc"
      ) 
    word5 = Document.create!(
      title: "Đơn Đề Nghị Thanh Toán Tiền Bảo Hiểm Thân Thể",
      content: "",
      department_id:4)
      word5.words.attach(
        io: File.open("public/words/yte.doc"),
        filename: "ĐƠN ĐỀ NGHỊ THANH TOÁN TIỀN BẢO HIỂM THÂN THỂ.doc"
      )
end

users = User.where(role:0).order(:created_at)
users.each do |user|
  request = user.requests.create!(
    student_content: "Các Thầy Cô kiểm tra hộ em cái biểu mẫu này với ạ, nếu được thì có thể cho em xin sau hôm nay không ạ?",
    document_id:1
    )
    request.files.attach(
      io: File.open("public/words/congtacsinhvien.doc"),
      filename: "Đơn Xin Cấp Bản Sao Kết Quả Học Tập.doc"
    ) 
    request.pdfs.attach(
      io: File.open("public/pdfs/bieumau.pdf"),
      filename: "bieumau.pdf"
    ) 
end
  