# SCSS Linter for HDM
### this linter has a few more custom rules applied to adhear to HDM's coding standards


## Installation

NOTE: If you don't have scss-lint gem installed skip over to step 3
NOTE: Please install from your USERNAME directory. 

### 1. Make sure previous gem is deleted localy
`gem uninstall scss_lint`
`gem clean scss_lint`

### 2. Make sure previous gem is deleted globaly
`sudo gem uninstall scss_lint`
`sudo gem clean scss_lint`

### 3. Make sure  scss_lint is not listed, if so, it was not uninstalled properly
 - `gem list`
 - `git clone -b master git@github.com:artemartemov/scss-lint-hdm.git scss-lint`
 - `cd scss-lint/`
 
### 4. Test Gem locally
`ruby -Ilib bin/scss-lint <path to scss file or folder>`

### 5. Install Gem to use with sublime text
`sudo gem build scss_lint.gemspec`
`sudo gem install scss_lint-0.52.0.gem`

### 6. Enjoy! 
