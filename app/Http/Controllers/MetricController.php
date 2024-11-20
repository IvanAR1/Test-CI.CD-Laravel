<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Metric;

class MetricController extends Controller
{
    public function index(){
        $metrics = Metric::all();
        return response()->json($metrics);
    }

    public function paginate(Request $request){
        $request->only(["page", "per_page"]);
        $request->validate([
            'page' => 'numeric',
            'per_page' => 'numeric',
        ]);
        $perPage = min($request->per_page, 10);
        $metrics = Metric::select(["name", "value", "id"])->paginate($perPage);
        return response()->json($metrics);
    }

    public function store(Request $request){
        $request->validate([
            'name' => 'required|string',
            'value' => 'required|numeric',
            'description' => 'nullable|string',
        ]);

        $metric = Metric::create($request->all());

        return response()->json(['message' => 'Métrica registrada con éxito', 'metric' => $metric], 201);
    }
}
