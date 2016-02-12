require "refile/s3"

aws = {
  if Rails.env.production?
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY_ID"],
    region: "ap-southeast-2",
    bucket: "freelancegrants"
  else
    access_key_id: API_KEYS["AWS_ACCESS_KEY_ID"],
    secret_access_key: API_KEYS["AWS_SECRET_ACCESS_KEY_ID"],
    region: "ap-southeast-2",
    bucket: "freelancegrants"
  end
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
