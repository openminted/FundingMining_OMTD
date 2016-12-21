# FundingMining_OMTD

## Run standalone

`cat input.xml | python madis/src/mexec.py -f  PATH/projects.sql -d PATH/projects.db > output.json`

## Docker
### Build 
`docker build -t <name>`

### Run 
`docker run -it -v <host-dir>:/usr/app/src --rm --name <name> <name>`

- For example
`docker run -it -v $PWD/output:/usr/app/src --rm --name <name> <name>`

### Results 
The docker images expects an `xml` file inside the folder and writes the result in a `results.json` file that is saved in the host
s filesystem.
