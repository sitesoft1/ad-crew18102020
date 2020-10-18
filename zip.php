<?php
$zip = new ZipArchive();
$zip->open( 'archive.zip', ZIPARCHIVE::CREATE );
function addFile( $path )
 {
 global $zip;
 if ( $content_cat = glob( $path.'/*') )
  {
  foreach ( $content_cat as $object )
   {
   if ( is_dir( $object ) ) {
    @chmod( $object, 0755 );
    addFile( $object );
    }
   else {
    @chmod( $object, 0644 );
    $zip->addFile($object);
    }
   }
  }
 }
addFile( __DIR__ );
$zip->close();
?>