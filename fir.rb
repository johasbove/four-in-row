# Juego 4 en Linea!!!!!!
# Johanna Salazar Bove

require "colorize"

def iniCeroMatriz(dim1,dim2)
	matrizInicial = []
	for i in 0..(dim1-1)
		matrizInicial[i] = []
		for j in 0..(dim2-1)
			matrizInicial[i][j] = 0
		end
	end
	return matrizInicial
end  

def imprimirMatriz(matrizActual,dim1,dim2)
	for i in 0..dim1
		for j in 0..(dim2-1)
			if (i==0)
				print "   #{i+j+1}   "
			else
				if (matrizActual[i-1][j] == 0)
					print " [   ] "
				else
					print " [ #{matrizActual[i-1][j]} ] "
				end
			end
		end
		print "\n"
	end
end

def actualizarMatriz(matrizActual,col,dim1,turno,numfichas)
	if(turno == 0)
		matrizActual[dim1-1-numfichas[col-1]][col-1] = "*"
	else
		matrizActual[dim1-1-numfichas[col-1]][col-1] = "@"
	end
	return matrizActual
end

def capturaCol(jugador1,jugador2,turno,numfichas,dim1)
	validcol = false
	col = gets.chomp.to_i
	for i in 1..dim1
		validcol = validcol || (col == i)
	end

	if (validcol)
		if (numfichas[col-1] == dim1)
			puts "Ups!! La columna esta llena! Por favor elige otra columna"
			if (turno == 0)
				puts "\n #{jugador1}"
			else 
				puts "\n #{jugador2}"
			end
			capturaCol(jugador1,jugador2,turno,numfichas,dim1)
		elsif (numfichas[col-1] < dim1)
			return col
		end
	else
		puts "Numero incorrecto. Por favor inserta un numero del 1 al 6"
		if (turno == 0)
			puts "\n #{jugador1}"
		else 
			puts "\n #{jugador2}"
		end	
		capturaCol(jugador1,jugador2,turno,numfichas,dim1)
	end
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def green(text); colorize(text, 32); end

def imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,k,p)
	puts "\n Felicitaciones!! Eres un genio!!"
	puts "i #{k} j #{p}"
	colore = false
	for i in 0..dim1
		for j in 0..(dim2-1)
			if (i==0)
				print "   #{i+j+1}   "
			else
				if (matrizActual[i-1][j] == 0)
					print " [   ] "
				else
					if (metodo == 1)
						for w in 0..3
							colore = colore || (i == k+1-w && j == p)
						end
						if (colore)
							print " [ " + green(matrizActual[i-1][j]) + " ] "
						elsif (!colore)
							print " [ #{matrizActual[i-1][j]} ] "
						end
						colore = false
					elsif (metodo == 2)
						for w in 0..3
							colore = colore || (j == p-w && i == k+1)
						end
						if (colore)
							print " [ " + green(matrizActual[i-1][j]) + " ] "
						elsif (!colore)
							print " [ #{matrizActual[i-1][j]} ] "
						end
						colore = false
					elsif (metodo == 3)
						for w in 0..3
							colore = colore || (i == k+1+w && j == p-w)
						end
						if (colore)
							print " [ " + green(matrizActual[i-1][j]) + " ] "
						elsif (!colore)
							print " [ #{matrizActual[i-1][j]} ] "
						end
						colore = false
					elsif (metodo == 4)
						for w in 0..3
							colore = colore || (i == k+1-w && j == p-w)
						end
						if (colore)
							print " [ " + green(matrizActual[i-1][j]) + " ] "
						elsif (!colore)
							print " [ #{matrizActual[i-1][j]} ] "
						end
						colore = false
					end

					
				end
				
			end
		end
		print "\n"
	end
end

def recorrerCol(matrizActual,dim1,dim2,col)
	contiguas1 = 0
	contiguas2 = 0
	habemusvictor = false
	jugador = 3
	metodo = 1
	i = col-1
	for j in 0..(dim2-1)
		if (matrizActual[j][i] == "*")
			contiguas1 += 1
			contiguas2 = 0
		elsif (matrizActual[j][i] == "@")
			contiguas2 += 1
			contiguas1 = 0
		else
			contiguas1 = 0
			contiguas2 =0
		end
		if (contiguas1 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,j,i)
			jugador = 1
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		elsif (contiguas2 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,j,i)
			jugador = 2
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		end	
	end
	contiguas1 = 0
	contiguas2 = 0
	return habemusvictor
end

def recorrerFilas(matrizActual,dim1,dim2,numfichas,col)
	contiguas1 = 0
	contiguas2 = 0
	habemusvictor = false
	jugador = 3
	metodo = 2
	i = dim1-numfichas[col-1]
	for j in 0..(dim2-1)
		if (matrizActual[i][j] == "*")
			contiguas1 += 1
			contiguas2 = 0
		elsif (matrizActual[i][j] == "@")
			contiguas2 += 1
			contiguas1 = 0
		else
			contiguas1 = 0
			contiguas2 =0
		end
		if (contiguas1 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,i,j)
			jugador = 1
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		elsif (contiguas2 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,i,j)
			jugador = 2
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		end	
	end
	contiguas1 = 0
	contiguas2 = 0
	return habemusvictor
end

def recorrerDiagonalNeg(matrizActual,dim1,dim2,numfichas,col)
	contiguas1 = 0
	contiguas2 = 0
	habemusvictor = false
	jugador = 3
	metodo = 4
	aux = 0
	k = 0
	filas = dim1 - numfichas[col-1]
	ifinal = filas
	jfinal = col-1
	while ((ifinal+aux < dim1) && (jfinal+aux < dim2) && matrizActual[ifinal+aux][jfinal+aux] != 0)
		ifinal = ifinal + aux
		jfinal = jfinal + aux
		aux = 1
	end
	while ((ifinal-k >= 0) && (jfinal-k >= 0))
		if (matrizActual[ifinal-k][jfinal-k] == "*")
			contiguas1 += 1
			contiguas2 = 0
		elsif (matrizActual[ifinal-k][jfinal-k] == "@")
			contiguas2 += 1
			contiguas1 = 0
		elsif (matrizActual[ifinal-k][jfinal-k] != "@" && matrizActual[ifinal-k][jfinal-k] != "*")
			contiguas1 = 0
			contiguas2 =0
		end
		if (contiguas1 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,ifinal,jfinal)
			jugador = 1
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		elsif (contiguas2 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,ifinal,jfinal)
			jugador = 2
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		end	
		k += 1
	end
	return habemusvictor
end


def recorrerDiagonalPos(matrizActual,dim1,dim2,numfichas,col)
	contiguas1 = 0
	contiguas2 = 0
	habemusvictor = false
	jugador = 3
	metodo = 3
	aux = 0
	k = 0
	filas = dim1 - numfichas[col-1]
	ifinal = filas
	jfinal = col-1
	while ((ifinal-aux >= 0) && (jfinal+aux < dim2) && matrizActual[ifinal-aux][jfinal+aux] != 0)
		ifinal = ifinal - aux
		jfinal = jfinal + aux
		aux = 1
	end
	while ((ifinal+k < dim1) && (jfinal-k >= 0))
		if (matrizActual[ifinal+k][jfinal-k] == "*")
			contiguas1 += 1
			contiguas2 = 0
		elsif (matrizActual[ifinal+k][jfinal-k] == "@")
			contiguas2 += 1
			contiguas1 = 0
		elsif (matrizActual[ifinal+k][jfinal-k] != "@" && matrizActual[ifinal-k][jfinal-k] != "*")
			contiguas1 = 0
			contiguas2 =0
		end
		if (contiguas1 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,ifinal,jfinal)
			jugador = 1
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		elsif (contiguas2 == 4)
			imprimirMatrizColoreada(matrizActual,metodo,dim1,dim2,ifinal,jfinal)
			jugador = 2
			puts "Jugador ganador #{jugador}"
			habemusvictor = true
			return habemusvictor
		end	
		k += 1
	end
	return habemusvictor
end

def verificarGanador(matrizActual,dim1,dim2,col,numfichas)
	habemusvictor = recorrerFilas(matrizActual,dim1,dim2,numfichas,col) || recorrerCol(matrizActual,dim1,dim2,col) ||
					recorrerDiagonalNeg(matrizActual,dim1,dim2,numfichas,col) || recorrerDiagonalPos(matrizActual,dim1,dim2,numfichas,col)
	return habemusvictor
end

def verificarEmpate(numtotal,dim1,dim2)
	empate = true
	if (numtotal == (dim1*dim2))
		return empate
	else
		return !empate
	end
end

def jugada(matrizActual,turno,jugador1,jugador2,numfichas,dim1,dim2)
	i = [0,1]
	if (turno == 0)
		puts "\n #{jugador1}"
	else 
		puts "\n #{jugador2}"
	end
	puts "Presiona un numero del 1 al 6 para escoger la columna sobre la cual quieres hacer caer tu ficha"
	col = capturaCol(jugador1,jugador2,turno,numfichas,dim1)
	actualizarMatriz(matrizActual,col,dim1,turno,numfichas)
	imprimirMatriz(matrizActual,dim1,dim2)
	turno = 1 - turno
	return col,turno
end

def numFichasTotal(numfichas)
	cuenta = 0
	for i in 0..(numfichas.length-1)
		cuenta = cuenta + numfichas[i]
	end
	return cuenta
end

def main 
	dim1 = 6
	dim2 = 6
	final = false
	numfichas = []
	for i in 0..(dim2-1)
		numfichas[i] = 0
	end
	matrizActual = iniCeroMatriz(dim1,dim2)

	puts "Bienvenido a tres en linea!! \n Escoge tu simbolo: \n Presiona 1 para escoger * \n Presiona 2 para escoger @"
	turno = gets.chomp.to_i-1
	puts "Ingresa el nombre del Jugador 1"
	jugador1 = gets.chomp.to_s
	puts "Ingresa el nombre del Jugador 2"
	jugador2 = gets.chomp.to_s
	puts "\n Bienvenido al Tablero de Juego! A divertirnos! \n "
	imprimirMatriz(matrizActual,dim1,dim2)

	while (!final)
		col, turno = jugada(matrizActual,turno,jugador1,jugador2,numfichas,dim1,dim2)
		numfichas[col-1] = numfichas[col-1] + 1
		final = verificarGanador(matrizActual,dim1,dim2,col,numfichas) || verificarEmpate(matrizActual,turno,dim2)
	end
end

main()