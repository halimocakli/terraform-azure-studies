data "archive_file" "halimsfile_backup" {
  type        = "zip"
  source_file = "../halimstextfile.txt"
  output_path = "${path.module}/backup.zip"
}
