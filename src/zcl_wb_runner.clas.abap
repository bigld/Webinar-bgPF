CLASS zcl_wb_runner DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_wb_runner IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA keys TYPE TABLE FOR ACTION IMPORT ZR_Webinar_bgPFData~generate.

    keys = VALUE #( ( %cid = '1' ) ).

    MODIFY ENTITIES OF ZR_Webinar_bgPFData
           ENTITY ZR_Webinar_bgPFData
           EXECUTE generate FROM keys
           FAILED FINAL(failed)
           REPORTED FINAL(reported).

    COMMIT ENTITIES.

*    DATA: bgpf_process TYPE REF TO if_bgmc_process_single_op.
*    DATA(bgpf_operation) = NEW zcl_wb_bgpf_operation_ctrl( CONV #( 'BGPF_B' ) ).
*
*    bgpf_process = cl_bgmc_process_factory=>get_default( )->create( ).
*    bgpf_process->set_name( 'Webinar' )->set_operation( bgpf_operation ).
*    bgpf_process->save_for_execution( ).
*
*    MODIFY zwb_bgpf_data FROM @( VALUE #( uuid  = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( )
*                                          data  = 'RUN'
*                                          stamp = utclong_current( ) ) ).

    COMMIT WORK.
  ENDMETHOD.
ENDCLASS.
