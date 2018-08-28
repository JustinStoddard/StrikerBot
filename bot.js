var Discord = require('discord.io');
var logger = require('winston');
var auth = require('./auth.json');
var dt = require('./date.js');

// Configure logger settings
logger.remove(logger.transports.Console);
logger.add(new logger.transports.Console, {colorize: true});
logger.level = 'debug';

// Initialize Discord Bot
var bot = new Discord.Client({
token: auth.token,
autorun: true
});

if (auth.token) {
  console.log('Recieving Authorization...');
};

bot.on('ready', function (evt) { //This block intializes the Striker Bot itself. Note that this is run before everything else.
  logger.info('Connected');
  logger.info('Logged in as: ');
  logger.info(bot.username + ' – (' + bot.id + ')');
  if (bot.username) {
    console.log('Striker Active...');
  };
});

bot.on('message', function (user, userID, channelID, message, evt) {
  // console.log('thing');
  if (message.substring(0, 1) == '!') {
  var args = message.substring(1).split(' ');
  var cmd = args[0];

  args = args.splice(1);
  switch(cmd) { 
    case 'striker':
      bot.sendMessage({
        to: channelID,
        message: 
        (`
        **These are commands I respond too** \n
        !striker - *This commands shows a list of all my current commands*.
        !purpose - *This command shares my purpose*.
        !intro - *This command shows a greeting*.
        !events - *This command shows event(s) for the current day*.
        `)
      });
    break;

    case 'intro': 
      bot.sendMessage({
        to: channelID,
        message: 
        (`
        Welcome to The Golden Remnants Cadet! Tag @Server Management to get your roles equipped! Make Aurum proud, Stay Golden!
        `)
      });
    break;

    case 'purpose':
      bot.sendMessage({
        to: channelID,
        message: 'I am the Personal AI Assistant to High General Vex'
      });
    break; 

    case 'events':
      bot.sendMessage({
        to: channelID,
        message: 
        (`
        **For ${dt.myDateTime()}**\n
        8pm EST - *Team Tac*
        Potential Raid.
        `)
      });
    break;
    }
  }
});
