
require 'i2c/drivers/lcd'

class LCD
	
	def imprimeix 
			display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27)
			#borrem a lescrit en pantalla
			display.clear()
		for i in (0..3)
			msg= gets.chomp
			display.text(msg,i)
		end
	end		
	
	def imprimir_ms(msg)
	
	display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27)
	#borrem a lescrit en pantalla
	display.clear()
	aux=msg.split("\n")
	for i in (0..3)
	if aux[i]!=nil
	display.text(aux[i].chomp,i)
	end
	end
	end	
end
 
if __FILE__==$0
	
	lcd = LCD.new
	puts "Entra el String multilina acabat amb el tabulador "
	String ms = gets("\t\n").chomp
	lcd.imprimir_ms(ms)
end
