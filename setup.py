try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

setup(name='python-skeleton',
      version='0.1',
      description='Stub description for python-skeleton.',
      install_requires=[],
      scripts=['bin/ps'],
      packages=[],
      author='Alexander Reitzel',
      author_email='funtimecoding@gmail.com',
      url='http://example.org',
      download_url='http://example.org/python-skeleton.tar.gz')
