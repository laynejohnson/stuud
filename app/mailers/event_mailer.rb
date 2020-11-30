class EventMailer < ApplicationMailer
  def confirmation
    @event = params[:event]
    mail(to: @event.client.email, subject: 'Lesson confirmed!')
  end

  def pdf_mailer(invoice_id)
    invoice = Invoice.find(invoice_id)
    attachments["invoice_#{invoice.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'invoice', template: 'invoice.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
    )
    mail(to: invoice.client.email, subject: 'Your invoice PDF is attached', invoice: invoice)
  end
end
end
