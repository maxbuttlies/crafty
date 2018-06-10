# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.name = %q{crafty}
	s.version = "0.2.1"

	s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
	s.authors = ["Rolf Timmermans", "Maximilian Buttlies"]
	s.date = %q{2018-06-10}
	s.description = %q{Crafty provides you the tools to easily and flexibly create HTML output with pure Ruby.}
	s.email = %q{hey@buttli.es}
	s.extra_rdoc_files = [
		"LICENSE",
		"README.md"
	]
	s.files = [
		"LICENSE",
		"README.md",
		"Rakefile",
		"VERSION",
		"crafty.gemspec",
		"lib/crafty.rb",
		"lib/crafty/builder.rb",
		"lib/crafty/safety.rb",
		"lib/crafty/tools.rb",
		"lib/crafty/toolset.rb",
		"lib/crafty/toolsets/html4.rb",
		"lib/crafty/toolsets/html4/all.rb",
		"lib/crafty/toolsets/html4/basic.rb",
		"lib/crafty/toolsets/html4/builder.rb",
		"lib/crafty/toolsets/html4/forms.rb",
		"lib/crafty/toolsets/html4/semantic.rb",
		"lib/crafty/toolsets/html5.rb",
		"lib/crafty/toolsets/html5/all.rb",
		"lib/crafty/toolsets/html5/basic.rb",
		"lib/crafty/toolsets/html5/builder.rb",
		"lib/crafty/toolsets/html5/forms.rb",
		"lib/crafty/toolsets/html5/semantic.rb",
		"test/test_helper.rb",
		"test/unit/builder_test.rb",
		"test/unit/html_test.rb",
		"test/unit/tools_test.rb",
		"test/unit/toolset_test.rb"
	]
	s.require_paths = ["lib"]
	s.rubygems_version = %q{1.5.2}
	s.summary = %q{Build HTML like a master craftsman.}
	s.test_files = [
		"test/test_helper.rb",
		"test/unit/builder_test.rb",
		"test/unit/html_test.rb",
		"test/unit/tools_test.rb",
		"test/unit/toolset_test.rb"
	]

	if s.respond_to? :specification_version then
		s.specification_version = 3

		if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
		else
		end
	else
	end
end
