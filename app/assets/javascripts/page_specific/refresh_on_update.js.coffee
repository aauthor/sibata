$ ->

  SBT = {} unless SBT?
  SBT.singletons ||= {}

  SBT.singletons.refresh_poller = new UpdatePoller('/tabs/last_update', 30000, -> document.location.reload() )

  $(document).on 'page:fetch', =>
    SBT.singletons.refresh_poller.stop()
    delete SBT.singletons.refresh_poller
