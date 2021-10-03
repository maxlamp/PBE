
require 'i2c/drivers/lcd'
 
	class LCD
			
		def imprimeix
			display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27)
			#borrem a lescrit en pantalla
			display.clear()
			for i in (0..3)
			String msg= gets.chomp
			display.text(msg,i)
			end
			
		end

	end
 
if __FILE__==$0
	lcd = LCD.new
	lcd.imprimeix
end
