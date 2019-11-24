# frozen_string_literal: true

require 'rspec'
require 'page-object'
require 'data_magic'
require 'faker'
require 'require_all'

require_rel 'pages'

World(PageObject::PageFactory)

# PageObject::PageFactory.routes = {}
