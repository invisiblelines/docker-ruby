# Ruby

Docker image to build Ruby using ruby-build. Defaults to 2.1.2 using the $RUBY_VERSION env variable.

Installs bundler and common system dependencies for gems.

Use this a base image for Ruby applications.

## Usage

### To build the image

	$ docker build -t invisiblelines/ruby .
	
### To run the image

	$ docker run -i -t --rm --name ruby invisiblelines/ruby


## License

MIT
