CLASS zcl_wb_bgpf_operation_ctrl DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_bgmc_op_single.

    METHODS constructor
      IMPORTING i_data TYPE string.

  PROTECTED SECTION.
    DATA data TYPE string.

    METHODS modify RAISING cx_bgmc_operation.

    METHODS save.
ENDCLASS.


CLASS zcl_wb_bgpf_operation_ctrl IMPLEMENTATION.
  METHOD constructor.
    data = i_data.
  ENDMETHOD.

  METHOD if_bgmc_op_single~execute.
*  messAGE 'd' type 'X'.
    modify( ).
    save( ).
  ENDMETHOD.

  METHOD modify.
    IF data IS INITIAL.
      RAISE EXCEPTION NEW cx_demo_bgpf( textid = cx_demo_bgpf=>initial_input ).
    ENDIF.
  ENDMETHOD.

  METHOD save.
    MODIFY zwb_bgpf_data FROM @( VALUE #( uuid  = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( )
                                          data  = data
                                          stamp = utclong_current( ) ) ).
  ENDMETHOD.
ENDCLASS.
