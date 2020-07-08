# SvxLink

This is the SvxLink service, it powers the entire node in the application. A
container is built according to the specifications in the `Dockerfile`. Once the
container is build, the last line specifies how the container should execute:

```
# ...
# Execute script
ENTRYPOINT ./run.sh
```

Even if you are not familiar with Docker, I recommend reading through the
`Dockerfile` and following the logical execution of the program.
