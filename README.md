# datadog-agent-ci Docker container

A Docker container with all required dependencies installed to be able to lint your code and run CI tests of https://github.com/DataDog/dd-agent.
This makes it possible to develop and test on MacOS or Windows, or even on Linux without polluting your system with all kind of dependencies.

There still might be packages missing to run all the ci tests, I only tested `rake ci:run[rabbitmq]` until now. Feel free to send pull requests :)

## Usage

```
# Clone the repository on your local disk
git clone git@github.com:DataDog/dd-agent.git
cd dd-agent


# Create and run the docker container (if this is the first time)
docker run -it --name datadog-agent-ci -v $PWD:/opt/dd-agent ulich/datadog-agent-ci

# or, if you already ran the command above and want to re-attach to the container:
docker start datadog-agent-ci
docker exec -it datadog-agent-ci bash


# you should now be inside the docker container, run the following commands
cd /opt/dd-agent

bundle install
rake setup_env

# Activate the virtual environment
source venv/bin/activate

# Lint
rake lint

# Run a flavored test
rake ci:run[rabbitmq]

```
