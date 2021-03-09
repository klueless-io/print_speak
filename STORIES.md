# Print Speak

> Print Speak basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt

As a Small Business Merchant, I want to calculate applicable tax and duties, so I am compliant with government regulations

## Development radar

### Stories next on list

As a Small Business Merchant, I want to calculate applicable tax and duties, so I am compliant with government regulations

- Read a data source, known as a shopping basket
- Convert data into a receipt with items
- Run tax and total calculations for the receipt
- Print out the receipt

## Stories and tasks

### Tasks - completed

Categorization Service

- Infer a product category
- Infer if product is imported

Create shopping cart report

- Take raw information from csv data source
- Convert information to receipt + items
- Render a report to the console

Create csv to item mapper

- Map item data from csv file to type safe item class

Create csv reader

- Read headings and rows
- Clean up issues with spaces and empty lines

Create a rounding module

- Round to nearest 5 cents
- Round to nearest (other amount), eg. 10 cent, 50 cent for completeness

Domain model: Receipt

- Add receipt model
- Build calculations

Domain model: Item

- Add item model
- Support strong parameters
- Build calculations

Setup project management, requirement and SCRUM documents

- Setup readme file
- Setup user stories and tasks
- Setup a project backlog
- Setup an examples/usage document

Setup GitHub Action (test and lint)

- Setup Rspec action
- Setup RuboCop action

Setup new Ruby GEM

- Build out a standard GEM structure
- Add automated semantic versioning
- Add Rspec unit testing framework
- Add RuboCop linting
- Add Guard for automatic watch and test
- Add GitFlow support
- Add GitHub Repository
