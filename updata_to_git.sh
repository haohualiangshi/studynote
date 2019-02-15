hexo clean
hexo generate
cp -R public/* git_io_blob/haohualiangshi.github.io
git add .
git commit -m "update"
git push origin master -u