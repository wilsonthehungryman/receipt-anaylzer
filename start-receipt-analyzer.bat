docker kill receipt-analyzer
docker rm receipt-analyzer
docker run --name receipt-analyzer  -it -v "d:/Dropbox/All Projects/tesseract-ruby":/usr/src/app/tesseract-ruby -v c:/Users/Wilson/Documents/Scans:/scans ruby-ocr:latest
