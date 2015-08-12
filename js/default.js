
$( document ).ready(function() {
  var Chat = function(rootElement)
  {
    this.settings = {
      messagesPerPage: 5,
      showMessages: 'libs/showMessages.php',
      send: 'libs/send.php'
    }

    var that = this;

    this.ui = {};
    this.ui.root = rootElement;
    this.ui.sendButton = this.ui.root.find("#send");
    this.ui.getMoreButton = this.ui.root.find("#getMoreMessages");
    this.ui.messagesDiv = this.ui.root.find('#messages');
    this.ui.message = this.ui.root.find('#message');
    this.ui.login = this.ui.root.find('#name');
    this.ui.firstMessageId = null;
    this.ui.firstMessage = null;
    this.ui.lastMessageId = null;
    this.ui.lastMessage = null;
    this.ui.mess = this.ui.root.find('.message');

    this.templates = {
      message: $('#template').html()
    }

    this.init = function()
    {
      return this.initUI().showmessages().getNewMessages();
    }

    this.initUI = function()
    {
      that.ui.sendButton.on('click', this.send);
      that.ui.getMoreButton.on('click', this.getMore);
      return this;
    }

    this.initAjax = function(sentUrl, data, callback)
    {
      $.ajax({
        type: 'POST',
        url: sentUrl,
        data: data,
        success: callback,
        dataType: 'json'
      });
    }

    this.showmessages = function(data)
    {
      var params = "?default=true&offset="+ that.settings.messagesPerPage;
      if (data == undefined) {
        that.initAjax(that.settings.showMessages + params, false, that.showmessages)
      } else {
        var tpl = that.templates.message;
        var wrappedData = {
          allMessages : data
          }

        var templated = Mustache.render(tpl, wrappedData);
        var messages = that.ui.messagesDiv.html(templated);

        that.setFirstMessageId(data);
        that.setLastMessageId(data);
        that.setFirstMessage(messages);
        that.setLastMessage(messages);
      }

      return this;
    }

    this.getNewMessages = function()
    {
      var firstMessage = that.ui.firstMessageId;
      if (firstMessage !== null) {
        var params = "?default=true&offset="+that.settings.messagesPerPage+"&first="+firstMessage;
        that.initAjax(that.settings.showMessages + params, false, that.putNewMessages);
      }

      setTimeout(that.getNewMessages, 5000);

      return this;
    }

    this.putNewMessages = function(data)
    {
      if (!$.isEmptyObject(data)) {
        that.setFirstMessageId(data)

        var tpl = that.templates.message;
        var wrappedData = {
          allMessages : data
        }
        var templated = Mustache.render(tpl, wrappedData);
        var newMessage = $(templated).insertBefore(that.ui.firstMessage);
        that.ui.firstMessage = newMessage;
      }
    }

    this.send = function()
    {
      var currentdate = new Date();
      var datetime = currentdate.getFullYear() + "-"
        + (currentdate.getMonth()+1)  + "-"
        + currentdate.getDate() + " "
        + currentdate.getHours() + ":"
        + currentdate.getMinutes() + ":"
        + currentdate.getSeconds();

      var messageJson = {
        "message": that.ui.message.val(),
        "login": that.ui.login.val(),
        "time":  datetime
      }

      that.initAjax(that.settings.send, messageJson);

      return this;
    }

    this.getMore = function(data, state)
    {
      var lastMessageId = that.ui.lastMessageId;
      var params = "?offset="+that.settings.messagesPerPage+"&last="+lastMessageId;

      if (state == undefined) {
        that.initAjax(that.settings.showMessages + params, false, that.getMore)
      } else {
        that.setLastMessageId(data);
        var tpl = that.templates.message;
        var wrappedData = {
          allMessages : data
        }
        var templated = Mustache.render(tpl, wrappedData);
        var lastMessage = $(templated).insertAfter(that.ui.lastMessage);
        that.ui.lastMessage = lastMessage.last();

      }
      return this;
    }

    this.setLastMessageId = function(data)
    {
      $.each(data, function(i, item){
        that.ui.lastMessageId = item.id;
      });
    }
    
    this.setFirstMessageId = function(data)
    {
      $.each(data, function(i, item){
        that.ui.firstMessageId = item.id;
        return false;
      });
    }

    this.setFirstMessage = function(messages)
    {
      that.ui.firstMessage = messages.find('.message').first();
    }

    this.setLastMessage = function(messages)
    {
      that.ui.lastMessage = messages.find('.message').last();
    }

    return this.init();
  }
  var mychat = new Chat($('#chat'));
});