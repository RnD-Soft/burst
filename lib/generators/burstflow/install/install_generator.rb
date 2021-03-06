require 'rails/generators'
require 'rails/generators/migration'

module Burstflow

  module Generators

    class InstallGenerator < ::Rails::Generators::Base

      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)
      desc 'Add the migrations for Burstflow'

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_migrations
        migration_template 'create_workflow.rb',
                           'db/migrate/create_workflow.rb'
      end

    end

  end

end
