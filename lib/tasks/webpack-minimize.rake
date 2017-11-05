namespace :webp do
  desc 'Run webpack with NODE_ENV set to production'
  task :min do
    sh 'NODE_ENV=production bin/webpack'
  end
end
