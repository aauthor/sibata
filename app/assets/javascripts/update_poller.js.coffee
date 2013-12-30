class @UpdatePoller

  constructor: (@last_update_url, @delay, @update_callback) ->
    @ping (start_time)=>
      @last_update = start_time
      @poll_interval = setInterval(@poll, @delay)

  poll: =>
    @ping (result_timestamp) =>
      if result_timestamp > @last_update
        @last_update = result_timestamp
        @update_callback(@last_update)


  ping: (callback)=>
    $.ajax
      url: @last_update_url
      dataType: 'json'
      success: (data) => callback( parseInt(data) )

  stop: =>
    clearInterval @poll_interval

