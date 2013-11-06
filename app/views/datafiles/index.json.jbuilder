json.array!(@datafiles) do |datafile|
  json.extract! datafile, :name
  json.url datafile_url(datafile, format: :json)
end
