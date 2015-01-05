# Python Skeleton


## Operation

To run the program from the `bin` directory, export `PYTHONPATH` first.

```sh
export PYTHONPATH=.
```


## Running tests

Install nosetests.

```sh
pip3 install nose2
```

Run tests.

```sh
nose2
```

Run ant like CI would. Requires ant to be installed.

```sh
ant
```


## Important details

The reason why the `tests` directiory is not called `test` is because of the nose2 convention.
