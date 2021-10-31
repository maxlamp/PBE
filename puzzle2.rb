
require 'gtk3'
require_relative 'puzzle1'

class Finestra_LCD <Gtk::Window


	def initialize
		super
		#Creem la finestra
		set_title('LCD')
		set_border_width(10)
		set_size_request(200,150)
		set_resizable(false)
		
		#Creem un box
		hbox = Gtk::Box.new(:vertical, 2)
		hbox.set_size_request(200,150)
		hbox.set_homogeneous(false)
		
		#TextView
		@text=Gtk::TextView.new()
		@text.set_size_request(200,100)
		
		#Creem el boto
		button=Gtk::Button.new(label:'Imprimir')
		button.signal_connect('clicked') {display}
		button.set_size_request(200,50)
		
		#Afegim tot a la box i depsres a la window
		hbox.pack_start(@text)
		hbox.pack_start(button)
		add(hbox)
		
		
		
		
	end
	def display
		#Buffer
		buf = @text.buffer
		lcd = LCD.new
		msg = buf.text
		buf.delete(buf.start_iter,buf.end_iter)
		#puts msg
		lcd.imprimir_ms(msg)
	end
	

end
if __FILE__ == $0
win = Finestra_LCD.new
win.signal_connect('destroy') { Gtk.main_quit }
win.show_all
Gtk.main

end
