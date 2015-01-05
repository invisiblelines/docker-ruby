# Ruby

Docker image to build Ruby using ruby-build. Defaults to 2.2.0 using the $RUBY_VERSION env variable.

Installs bundler and common system dependencies for gems.

Use this a base image for Ruby applications.

## Usage

The image builds Ruby using an ONBUILD command so the actual install of Ruby is deferred until you build another image using this image as the base.

### Use this image from Docker Hub

In your Dockerfile reference the prebuilt image as the base

		FROM invisiblelines/ruby:2.2.0

### To build the image

		$ git clone https://github.com/invisiblelines/docker-ruby.git
		$ cd docker-ruby
		$ docker build -t ruby:2.2.0 .

## License

MIT
