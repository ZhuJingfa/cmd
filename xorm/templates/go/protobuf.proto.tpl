//proto 模板文件生成
syntax = "proto3";

package fh.srv.package;
{{range .Tables}}
//{{Mapper .Name}} protobuf Message定义Template
message {{Mapper .Name}} { {{$table := .}}{{$iter := 0}}
{{range $index, $colIndex := .ColumnsSeq}}{{$col := $table.GetColumn $colIndex}}    {{fetchProtoType $col}} {{$col.Name}} = {{fetchProtoIter $index}}; //{{$col.Comment}}
{{end}}{{/* range */}}}
{{end}}{{/* range .Tables */}}