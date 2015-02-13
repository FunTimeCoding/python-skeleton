try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': 'Stub description for python-skeleton.',
    'author': 'Alexander Reitzel',
    'url': 'http://funtimecoding.org',
    'download_url': 'http://funtimecoding.org/download/python-skeleton.tar.gz',
    'author_email': 'funtimecoding@gmail.com',
    'version': '0.1',
    'install_requires': [],
    'packages': [],
    'scripts': ['bin/ps'],
    'license': 'MIT',
    'name': 'python-skeleton'
}

setup(**config)
