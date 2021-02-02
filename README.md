# DocGenerator

Create final documents after a format template.

## Getting Started

You can git clone the project and run on your local computer or install the gem. Works on plain Ruby projects and also Rails.

### Prerequisites

You will need

```
ruby > 2.3
```

### Installing

Install the gem directly

```
gem install doc_generator
```

Or add it to your Gemfile:

```
gem "doc_generator"
```

And run `bundle install`

## Usage

On one hand you need the template setting the format and on the other the dataset with the content to use for replacing standard marks (currently only taking them in the form '[CLAUSE-n]' and '[SECTION-n]').

First you need to require the module:

```
require 'doc_generator'
```

Then you can call the main class method:

```
DocGenerator.format(template_file, dataset_file)
```

By default this will generate a file 'output.txt' (default name is 'output').
You can change this by adding any of the following options:

* `ext` -> for extension. Ex. `ext: .docx`
* `screen` -> to print results in screen. Ex. `screen: true`

```
DocGenerator.format(template_file, dataset_file, ext: ".docx")
DocGenerator.format(template_file, dataset_file, screen: true)
```

Alternatively you can instantiate a `DocGenerator::Generator` object and call `format` method:

```
generator = DocGenerator::Generator.new(template_file, dataset_file)
generator.format(screen: true)
```

* Important! Please notice the generated output file will be downloaded in the Directory where the library is included.

## To do

With some more time to work on it the library could become more generic allowing more options and flexibility in the templates structure and matching keys and the way the dataset is included. 

Also Rubocop could be used and some style guidelines set.

## Authors

* **Nicolás Tonnelier** - *Initial work* - [natonnelier](https://github.com/natonnelier)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
