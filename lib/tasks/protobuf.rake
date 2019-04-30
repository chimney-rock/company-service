namespace :protobuf do
  desc 'Clean & compile the protobuf source to ruby classes.'
  task :compile, [:package, :source, :destination, :plugin, :file_extension] do |t, args|
    args.with_defaults(destination: 'lib/protobuf')
    args.with_defaults(source: 'definitions')
    args.with_defaults(file_extension: '.pb.rb')

    command = []
    command << 'protoc'
    command << "--ruby_out=#{args[:destination]}"
    command << "-I #{args[:source]}"
    command << Dir["#{args[:source]}/#{args[:package]}/**/*.proto"].join(" ")
    full_command = command.join(" ")

    puts full_command
    system(full_command)
  end
end
