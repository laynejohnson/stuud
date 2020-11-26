import { Controller} from "stimulus"
import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ["calendar", "modal", "start_time", "end_time", "color"]

  connect() {
    let _this = this
    let calendar = new Calendar(this.calendarTarget, {
      events: '/events.json',
      droppable: true,
      navLinks: true,
      initialView: 'timeGridWeek',
      slotMinTime: '06:00:00',
      slotMaxTime: '24:00:00',
      eventBackgroundColor: '#FA6C00',
      eventBorderColor: '#414D58',
      editable: true,
      headerToolbar: { center: 'timeGridWeek,timeGridDay,dayGridMonth' },
      plugins: [dayGridPlugin,timeGridPlugin,interactionPlugin],
      navLinkDayClick: function(date, jsEvent) {
        _this.modalTarget.style.display = "block"
        _this.start_timeTarget.value = date
        _this.end_timeTarget.value = date
      },
      eventClick: function (info) {
        info.jsEvent.preventDefault()
        Turbolinks.visit(info.event.extendedProps.show_url)
      },
      eventDrop: function (info) {
        let data = _this.data(info)
        Rails.ajax({
          type: 'PUT',
          url: info.event.url,
          data: new URLSearchParams(data).toString()
        })
      },
      eventResize: function (info) {
        let data = _this.data(info)
        Rails.ajax({
          type: 'PUT',
          url: info.event.url,
          data: new URLSearchParams(data).toString()
        })
      },
    })
    calendar.render()
  }

  data(info) {
    return {
      "event[start_time]": info.event.start,
      "event[end_time]": info.event.end,
    }
  }
}