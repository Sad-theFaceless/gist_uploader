# gist_uploader
Upload any file to your GitHub Gists (including binary files).

## Download
### GNU/Linux
```bash
wget https://raw.githubusercontent.com/Sad-theFaceless/gist_uploader/main/gist_uploader.sh && chmod +x gist_uploader.sh
```

## How to use
```bash
./gist_uploader.sh "gist_ID" "commit message" "file(s)"
```
- **gist_ID** is in the gist URL: "https<span>://</span>gist.github.com/USERNAME/gist_ID".

## Example
```bash
./gist_uploader.sh "1234567890a1b2c3d4e5f6g7h8i9j10k" "adding dummy archive" "dummy.zip"
```
