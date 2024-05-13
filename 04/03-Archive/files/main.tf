
# İlk olarak aşağıdaki kaynağı yaratıyoruz. Ardından archive klasörü altındaki main.tf dosyasını çalıştırıyoruz.
resource "local_file" "halimsfile" {
  content  = "This is Halim's text file."
  filename = "../halimstextfile.txt"
}
