# frozen_string_literal: true

require 'discordrb'
require 'pry'
require_relative 'init'
Dir['./models/*.rb'].sort.each { |file| require file }

require_relative 'command/list'
require_relative 'command/register_commands'
require_relative 'command/request'
require_relative 'command/options'

WeaponTypesInitializer.initialize_weapon_types
GlobalStatsInitializer.initialize_global_stats


bot = Discordrb::Bot.new(token: ENV.fetch('SLASH_COMMAND_BOT_TOKEN', nil), intents: [:server_messages])
Command::RegisterCommands.run(bot: bot)

Command::LIST.each do |command|
  bot.application_command(command.name) do |event|
    puts "#{event.user.username} executed command: #{command.name}"

    request = Command::Request.new(event: event)
    command.execute(request: request)
  end
end

bot.run
