# ProyectoFinal_MAC_MAS_OpenLane

## Descripción

Proyecto final de IC Design correspondiente al diseño, implementación y caracterización de un módulo **MAC/MAS (Multiply-Accumulate / Multiply-Accumulate-Subtract)** en **Verilog HDL**, utilizando el flujo físico **OpenLane / LibreLane** con la tecnología **SKY130**.

El diseño implementa operaciones aritméticas de punto flotante y fue validado mediante simulación RTL, síntesis lógica, análisis temporal (STA), estimación de potencia y generación del layout físico final.

---

## Arquitectura del diseño

El módulo principal implementado es:

* **mac_mas_core**

Submódulos utilizados:

* fpmul
* sum_res_pp
* rounder
* add_renorm
* leading_zero_norm
* exp_mant_logic
* op_sign_logic

El sistema soporta:

* Operación **MAC (Multiply-Accumulate)**
* Operación **MAS (Multiply-Accumulate-Subtract)**
* Señales de control `start`
* Señal de sincronización `ready`
* Reset síncrono del sistema

---

## Herramientas utilizadas

* Verilog HDL
* Icarus Verilog (iverilog)
* GTKWave
* Yosys
* OpenLane / LibreLane
* OpenROAD
* KLayout
* SKY130 PDK

---

## Simulación y validación

La validación funcional se realizó mediante testbenches desarrollados en Verilog.

Casos evaluados:

* MAC TEST 1
* MAC TEST 2
* MAS TEST
* Caso excepcional de reset

Las formas de onda fueron visualizadas usando **GTKWave**.

---

## Caracterización del chip

Resultados principales obtenidos:

| Parámetro       | Resultado |
| --------------- | --------- |
| Potencia total  | 10.60 mW  |
| Internal Power  | 6.768 mW  |
| Switching Power | 3.832 mW  |
| Leakage Power   | 9.14 nW   |

Se realizaron análisis de:

* Área
* Timing (WNS/TNS)
* Potencia
* DRC
* LVS
* Antenna Check

---

## Estructura del repositorio

```txt
src/        -> Código fuente Verilog
test/       -> Testbenches
config/     -> Configuración OpenLane y constraints
reports/    -> Reportes STA y potencia
layout/     -> Layout final generado
docs/       -> Informe/PDF del proyecto
```

## Autores

* Yeiner Estiven Martinez Cañas
* Anderson Parra Guerrero
* Jaime Eduardo Jaramillo Peña
* Juan Jose Serna Tabares
