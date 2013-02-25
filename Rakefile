desc "Upload to cv.caius.name"
task :upload do
  sh "rsync -r --progress -e 'ssh' html/ titus:www/cv.caius.name/htdocs"
end
